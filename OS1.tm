<TeXmacs|1.99.5>

<style|generic>

<\body>
  2. The <verbatim|Condition2> class has field variable
  <verbatim|conditionLock> of type <verbatim|Lock> and a LinkedList
  <verbatim|waitQueue> containing KThreads sleeping on this condition
  variable.\ 

  In <verbatim|sleep()> method, the thread releases the lock, disables
  interrupt before it adds itself to the waitQueue, and restores interrupts
  and acquires the lock upon woken.\ 

  In <verbatim|wake()> method, first disable interrupts, remove the first
  thread in the waitQueue, then restores interrupt.\ 

  In <verbatim|wakeAll()> method, just call <verbatim|wake()> until waitQueue
  is empty.\ 

  3. In <verbatim|Alarm> class, add a field variable of type
  <verbatim|TreeSet\<less\>WaitThread\<gtr\>>, this will keep the threads
  sorted by the time they are supposed to wake up. In the timer interrupt
  method, ready threads that are supposed to wake up.\ 

  4. In <verbatim|Communicator> class, add new field variable
  <verbatim|lock>, <verbatim|speakerCond>, <verbatim|listenerCond>; a boolean
  variable <verbatim|hasWord>, and integer variable <verbatim|listenerCount>
  and <verbatim|word>.\ 

  Speaker: acquires the lock, waits for the current word to be received and
  there is at least one listener, then speaks the word and releases the lock.\ 

  Listener: acquires the lock, waits for a word to receive, returns it then
  releases the lock.\ 

  5. Add new variable <verbatim|cachedEffectivePriority> and
  <verbatim|isQueueDirty> to class <verbatim|PriorityQueue>; and add new
  variable <verbatim|cachedEffectivePriority> and <verbatim|isThreadDirty> to
  class <verbatim|ThreadState>. We cache the effective priority, and if
  <verbatim|isThreadDirty/isQueueDirty> is set to false, the effective
  priority is valid. Otherwise, recalculate the effective priority. A queue
  is set to dirty when a new thread has been added, or any existing thread in
  its queue flags itself as dirty. A thread is set to dirty when its priority
  changes, or when any queue that it currently holds flags itself as dirty.\ 

  6. If there are more than two children on Oahu, they will row to Molokai,
  and one will return (if there are still people left on Oahu). If there is
  only one child on Oahu, an adult will row to Molokai, then a child will
  return. In this way, all people eventually arrives in Molokai.\ 
</body>