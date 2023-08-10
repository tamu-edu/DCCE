#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

void bar()
{
  printf("bar\n");
}
void* func(void* ptr) {
  printf("thread starts\n");
}
int main() {
  pthread_t p_thread;
  char* msg = "th1";

  bar();

  pthread_create(&p_thread, NULL, func, (void *) msg); 
  pthread_join(p_thread, NULL);


  return 0;
}
