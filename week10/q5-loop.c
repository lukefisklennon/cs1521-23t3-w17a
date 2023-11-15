#include <stdio.h>
#include <pthread.h>

struct bla {
	int a;
	int b;
};

void *thread_run(void *data) {
	struct bla *input = (struct bla *) data;

	while (1) {
		printf("%d, %d\n", input->a, input->b);
	}

	return NULL;
}

int main() {
	// char *message = "Bye\n";
	struct bla message;
	message.a = 2;
	message.b = 3;

	pthread_t thread;
	pthread_create(&thread, NULL, thread_run, &message);

	while (1) {
		printf("Hello\n");
	}
}
