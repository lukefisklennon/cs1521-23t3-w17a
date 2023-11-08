#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

void chmod_if_public_write(char *path);

int main(int argc, char *argv[]) {
	if (argc < 2) {
		// Print an error to standard error if needed
		fprintf(stderr, "Please provide 1 or more arguments");
	}

	// Loop through the arguments and process each one
	int i = 0;
	while (i < argc) {
		chmod_if_public_write(argv[i]);
		i++;
	}

	return EXIT_SUCCESS;
}

void chmod_if_public_write(char *path) {
	struct stat info;
	int result = stat(path, &info);
	if (result != 0) {
		perror(path);
		return;
	}

	if (info.st_mode & S_IWOTH) {
		mode_t new_mode = info.st_mode;
		new_mode = new_mode & ~S_IWOTH;
		chmod(path, new_mode);
		if (result != 0) {
			perror(path);
			return;
		}
	}
}
