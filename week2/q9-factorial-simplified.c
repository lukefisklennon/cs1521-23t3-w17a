// Simple factorial calculator - without error checking

#include <stdio.h>

int main(void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);

    int fac = 1;
    int i = 1;
    for (i <= n) {
        fac = fac * i;
        i = i + 1;
    }

    printf("n! = %d\n", fac);
    return 0;
}
