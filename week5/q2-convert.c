#include <stdio.h>

void convert(int value) {
	printf("%d = 0%o = 0x%x\n", value, value, value);
}

int main() {
	convert(10);
}
