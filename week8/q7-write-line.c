#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	if (argc != 2) {
		printf("Usage: %s <filename>\n", argv[0]);
		return EXIT_FAILURE; // 1
	}

	FILE *file = fopen(argv[1], "w");
	if (file == NULL) {
		perror(argv[1]);
		return EXIT_FAILURE; // 1
	}

	int c = fgetc(stdin);
	while (c != EOF) {
		fputc(c, file);

		if (c == '\n') {
			break;
		}

		c = fgetc(stdin);
	}

	fclose(file);
}
