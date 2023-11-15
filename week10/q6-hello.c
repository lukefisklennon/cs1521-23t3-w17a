#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *thread_run(void *data) {
    printf("Hello from thread!\n");

    int *result = malloc(sizeof(int));
    *result = 42;

    return result;
}

int main(void) {
    pthread_t thread;
    pthread_create(
        &thread,    // the pthread_t handle that will represent this thread
        NULL,       // thread-attributes -- we usually just leave this NULL
        thread_run, // the function that the thread should start executing
        NULL        // data we want to pass to the thread -- this will be
                    // given in the `void *data` argument above
    );

    void *result;
    pthread_join(thread, &result);

    int *number = (int *) result;
    printf("%d\n", *number);
    free(number);

    return 0;
}
