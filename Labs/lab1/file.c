#include <stdio.h>
#include <stdlib.h>

int main() {
	char c;
	int x;
	unsigned int y;
	short s;
	long l;
	long long L;
	void* v;

	printf("%d %d %d %d %d %d %d ", sizeof(c), sizeof(x), sizeof(y), sizeof(s), sizeof(l), sizeof(L), sizeof(v));
	return 0;
}
