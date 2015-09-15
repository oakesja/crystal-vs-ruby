#include <stdio.h>

int main( int argc, char *argv[] )
{
    printf("%d\n", fib(atoi(argv[1])));
    return 0;
}

int fib(int n) {
    if(n == 0 || n == 1) {
		return n;
	}
	else {
		return (fib(n-1) + fib(n-2));
	}
}