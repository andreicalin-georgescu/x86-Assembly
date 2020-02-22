#include <stdio.h>

#define NMAX 4
// ??????????????????????????????
int main() {

	int i = 0, x, arr[NMAX], e, l, r, mid = -1;

	scanf("%d", &e);
	printf("%d\n", e);

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
	l = 0;
	r = NMAX - 1;
	goto binary;


make_mid:
	mid = l + (r - l) / 2;

binary:
	if(l <= r) 
		goto make_mid;
	printf("%d == mid \t", mid);
	if(arr[mid] == e)
		goto show_x;
	if(l > r)
		goto show_x;
	if(arr[mid] > e) {
		r = mid - 1;
		goto binary;
	}
	if(arr[mid] < e) {
		l = mid + 1;
		goto binary;
	}

	//mid = -1;

show_x:
	printf("%d = rez", mid);
	return 0;
}
	
