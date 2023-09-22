#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto main__if_small_big;
    if (x >= 1000) goto main__if_small_big;

main__if_medium:
    printf("medium\n");
    goto main__if_end;

main__if_small_big:
    printf("small/big\n");

main__if_end:
    return 0;
}
