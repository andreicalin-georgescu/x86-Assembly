#include <stdio.h>

#define NMAX 6

int main() {

	int i = 0, x, arr[NMAX], max = -100000000;
loop:
	scanf("%d", &x);
	arr[i] = x;
	i++;
	if(i < NMAX)
		goto loop;
	if(i == NMAX)
		goto show;
show:
	fclose(stdin);
	//for(int j = 0; j < i; j++)
		//printf("%d ", arr[j]);
	i = 0;
	goto find;

find:
	if(arr[i] > max)
		max = arr[i];
	i++;
	if(i >= NMAX)
		goto show_max;
	goto find;

show_max:
	printf("%d ", max);
	return 0;
}
