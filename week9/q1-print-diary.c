#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DIARY_FILE ".diary"

int main(int argc, char *argv[]) {
	char *home = getenv("HOME");
	if (home == NULL) {
		home = ".";
	}

	int diary_path_len = strlen(home) + strlen(DIARY_FILE) + 2;
	char *diary_path = malloc(diary_path_len);

	snprintf(diary_path, diary_path_len, "%s/%s", home, DIARY_FILE);

	FILE *diary_file = fopen(diary_path, "r");
	if (diary_file == NULL) {
		perror(diary_path);
		return EXIT_FAILURE;
	}

	int c;
	while ((c = fgetc(diary_file)) != EOF) {
		printf("%c", c);
	}

	fclose(diary_file);
	free(diary_path);

	return EXIT_SUCCESS;
}
