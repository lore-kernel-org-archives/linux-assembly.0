From: "Lada 'Ray' Lostak" <ray@unreal64.net>
Subject: Threads, timing
Date: Mon, 7 Oct 2002 09:07:02 +0200
Sender: linux-assembly-owner@vger.kernel.org
Message-ID: <002801c26dd0$22da4430$0d01a8c0@utopia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-assembly-owner@vger.kernel.org>
List-Id: <linux-assembly.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-assembly@vger.kernel.org

Hi there :o)

    I have small advanced problem about threads and sync. As you may
remeber, we are porting huge application to linux. It is not problem at all,
because we expect applications to be ported, so, it is ready. But right now,
we don't know, if we can use more 'optimized' way for sync objects, because
we don't know, if we can implement on linuxes. On linuxes, we don't use
glibc at all, we use direct kernel calls (except sysdep components, such as
database wrappers and other - they are compiled standalone). I don't want to
flamewar about this (as usually :) bt it is done for shariong binaries acros
more OS and one CPU.

    My situation: I have own sync objects (mutex, events, semaphore, rwguard
and others). Let's look closely only on mutex. Mutex allows ONE thread to
access shared datas. This thread can 'lock' mutex in recursion. if 10x
'lock' then 10x leave need to be called ofcourse.

    Our 'sysdep' part of code implement '2' basic things:

1. 'thread'
2. 'core sycn object'

(1) implement function like: suspend thread (another), resume, and similar
(it is pretty easy to implement)
(2) implement 4 functions like: create/destroy/wait/signal. If wait is
called ans object is in non-signalized state, it 'waits' execution, before
some another threads call 'signal'. This can be easily implement by sigwait
and other signal functions.

We also uses 'spin locks' (lock + cmpxchg instruction). Spin lock allows:
'try enter' 'enter' (and if not spin is not free, then switch to some
another thred - delay execustion), and finally 'leave'.

My problem is in race condition. We fixed all race condition and our sync
objects run pretty well (at windoze they are much faster than oririginal
Win32 API ones :)

But there is a way, how to make it faster. I will in fast explain, how mutex
works (it is clean, but it is needed to show my race condition). I will
welcome any ideas, how to make code better, if you will have any :o)

Last thing before we will start 'critical section' is implemented by system
depenend thing (2). It is verry simple code and I don't think I need to
paste it here (but I can ofcourse). There are no race condition or problems
in (2). To imagine, source code of (2) have ~60 lines and (1) ~450 (it
includes creating threads, all other function related to threads). Linux
port will have (1) smaller and (2) bigger :)

mutexLock function look this way:

thread=get_current_thread_object();
lock_critical_section();
if mutex is free
    mark mutex as taken / increase lock count if necessary (recursion)
    remeber thread
    leave_critical_section
    return(OK)

if (time_to_wait==INFINITE)
    thread_list_add(thread)
    *1*
    leave_critical_section
    *2*
    ret=sleep_exection(thread,INFINITE);
else
    thread_list_add_higher_prior(thread)
    *3*
    leave_critical_section
    *4*
    sleep_exection(thread,time_to_wait);
    *5*
    if (OwnerThread==thread)
        return(OK)
    *6*
    lock_critical_section;
    ret=thread_list_remove(thread)
    leave_critical_section;

    if (ret!=FILE_NOT_FOUND)
        return(TIMEOUT)

return(OK);

So, I think this pseudocode is clean. If not, let me know. On success it
returns OK, if fail TIMEOUT. Ofcourse, it doesn't check parametres and
similar. Just pseudocode. (all code is pretty simple, if any1 will want to
add threading to linux-asm, let me know, I can help).

Next important part is 'unlock':

mutex_unlock

thread=get_current_thread_object();
lock_critical_section();
owned_count--;
if owned_count>0
    return;

owned_thread=NULL; // 'release ' owning

// some thread waiting
if (thread2=thread_list_get_item)
    *A*
    // give mutex to that thread
    owned_count=1;
    owned_thread=thread2;
    *B*
    sleep_cancel(thread2);

unlock_critical_section

So, there is few race conditions. First, at *4* (or code before execution is
really sleeped). Let assume we ahev mroe CPU or kernel switches us. It will
happend, that we POST to thread list thread to wait, BUT some anotehr thread
pop us from list and 'cancel our slee' BEFORE we enter 'sleep' itselfs. It
is problem. It is fixed on sleep and sleep_cancel functions, which are still
system indepnend. There are 2 spin locks which make this very fast and race
condition free. With fast I mean, that if object is 'free' then it returns
(ofcourse :) without switch to kernel mode and call real 'sleep' function
(sigwait). So, all works fine. Many other race-conditions are killed by
'critical_section' used in mutex.

After returning from 'sleeping' with timeout (*5*) we have to check what
happends. If we are owning mutex ('read' int-sized var without sync is safe)
then we return OK. If not, we have 'remove' is from list. There is race
condition - thread 2, calling unlock, may 'cancel sleep' us as THIS point.
That's why we enter again critical_section, remove us from list (*6*) and
unlock section. Now we check, if we was really removed. If yes, we return
OK - and 'race condition' is over. Checking owning diectly before this code
is just for speed reasons.

Similar way are fixed all other race-conditions.

BUT..... We have to look a closely on sleep and sleep_cancel functions:

2 spin locks: spin_sleep and spin_sleep2

sleep:

spin_lock(spin_sleep1)
spin_lock(spin_sleep2)

if (!sleep_canceled)
    *1*
    ret=system_sleep_cancelable(time_to_wait,&sleep_lock2);
else
    *2*
    sleep_canceled=0
    spin_unlock(sleep_lock2);
    ret=OK;

spin_unlock(sleep_lock1);

sleep_cancel:

spin_lock(sleep_lock2);
*A*
if (spin_lock_try(sleep_lock))
    *B*
    sleep_canceled=1;
    spin_unlock(sleep_lock1);
    spin_unlock(sleep_lock2);
else
    *C*
    system_sleep_cancel(which_thread_ofcourse)
    spin_unlock(sleep_lock2);

This is all. "Sleep" function lock both spins. spin1 means 'I am sleeping'
and spin 2 is mutal exclusion. Then it checks member sleep_canceled. If it
si true (*2*) it means, that sleep_cancel was called BEFORE we really enter
sleep loop (race). So, in this case jsut leave spin locks and return OK
state. If not (*1*) call system_sleep and PASS into tis routine spinlock.
This routine will return OK (of someone will cancel is) or TIMEOUT
(operation timeout). Why we are passing spin lock to system routine and do
not leave here ? Because of next race condition. System routine, have to do
'2' steps:

1. prepare for sleep (empty 'I was canceled')
2. exec system call

If we will be switched, before we are prepared, race condition occurs and
deadlock is here. So, we are doing also

1.5. unlock_spin_lock

And all works fine. System depened code is pretty small and fast, because
spin locks are nice ones. This deadlock (second thread really waits)
happends just 'time-from-time' (at my dual CPU 1x per ~100K runs). So, it
doesn't take CPU.

And now I am into 'center' why I am writing this.

As you can see, system depenend parts are small. I have oen idea, how make
this more fast (a lott of).

You remeber, that 'critical_section' used in sync objects (mutex in this
case) is 'system sync' (it really waits and do nto consume power in while
(1) ;). So, the same way, as I pass to system routine 'spin lock' at the
end, I can remove 'leave_critical_section' from sync objects and pass THIS
critical section to system routine. All race condition will be over too,
code will be faster. BUT....

But 'system sleep' have to do '2' things as atomic operations. It have to
'signalize' object and wait. Under windoze, there is function
'SignalObjectAntWait' which can be used for this purposes. But I am not
sure, if similar function exists in linux - and on kernel layer ofcourse.

So, basically, I need to process '2' kernel calls as ATOMIC operation:

1. send_signal_to_some_thread
2. wait_for_signal

If we will be swicthed between 1 and 2, we are in possible deadlock [it will
not happend often, but it WILL - I allready tried :)

I didn't find similar function in scheduler.c or signal.c

Is there some way, how to make this ? Basically, I need 'synchonize' with
REAL 'sleep start'. I am not sure, if play with priority is clever at all
(if it will work always, etc.).

Far enough will be fucntion 'send_signal_and_wait' - as one atomic kernel
call :)

If you have any idea, how to make it faster, let me know :)

I can't do 'faster sync objects for WIN and slower for Linux' - because I
don't want to produce #ifdef SYSTEM_HAVE_ATOMIC_OPER in all sync objects.
All the code is without #ifdef's and I want to keep this state :)


Anyway, inludes new kernel (or are here some plans) to put 'sync object' as
kernel call, or signals is the only ways todays, how sync threads ?

Thank in for your time (it is long post I know :) and ideas.
Feel free to ahve any Q, if I didn't explain everything clear.
Sorry for typos and language mistakes

Best regards,
Lada 'Ray' Lostak
Unreal64 Develop group
http://www.unreal64.net

--------------------------------------------------------------------------
In the 1960s you needed the power of two C64s to get a rocket
to the moon. Now you need a machine which is a vast number
of times more powerful just to run the most popular GUI.


