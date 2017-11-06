#include <stdio.h>

int main() {
	int i;

	for (i=0; i<3; i++) {
		printf("hello world!!\r\n");
		fflush(stdout);
	}
	printf("\r\n");

	return 0;
}
