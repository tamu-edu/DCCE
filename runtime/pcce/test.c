
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdint.h>
//#include <pthread_np.h>

#define NUMTHREADS 2
__thread uint64_t tls_var;

void *threadfunc(void *param) {
  int* id = (int*)param;

  for (int i = 0 ;i < 100; i++) {
    tls_var = *id + 1;
    printf("[%d] tls_var: %lu\n", *id, tls_var);
  }

  *id = *id + 1;

}

int main()
{
  pthread_t thread[NUMTHREADS];
  int targ[NUMTHREADS];

  for (int i = 0; i < NUMTHREADS; i++) {
    targ[i] = i;
    pthread_create(&thread[i], NULL, threadfunc, (void*)&targ[i]);
  }

  for (int i = 0; i < NUMTHREADS; i++) {
    pthread_join(thread[i], NULL);
  }
  
  for (int i = 0; i < NUMTHREADS; i++) {
    printf("targ[%d] = %d\n", i, targ[i]);
  }
  return 0;
}
