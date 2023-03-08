#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>


pthread_mutex_t lock;
pthread_barrier_t barrier;

#define NUM_THREAD 2
void foo()
{
  std::cout << "calling foo" << std::endl;
}

void * threadFunc(void * arg)
{
  pthread_mutex_lock(&lock);
  foo();
  pthread_mutex_unlock(&lock);
  sleep(2);
  pthread_barrier_wait(&barrier);
  return NULL;
}

int main()
{
  pthread_barrier_init(&barrier, NULL, NUM_THREAD);
  pthread_t threadId[NUM_THREAD];
  for (int i = 0; i < NUM_THREAD; i++) {
    int err = pthread_create(&threadId[i], NULL, &threadFunc, NULL);
    if (err)
    {
      std::cout << "Thread creation failed : " << strerror(err);
      return err;
    }
  }

  for (int i = 0; i < NUM_THREAD; i++) {
    pthread_join(threadId[i], NULL);
  }

  return 0;
}
