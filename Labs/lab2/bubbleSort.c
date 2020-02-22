#include <stdio.h>

int main() {

	int arr[] = {64, 34, 25, 12, 22, 11, 90}; 
	int n = sizeof(arr)/sizeof(arr[0]);

	int i, j;

	i = -1;
	j = 0;
	int k = 0;

bubble:
	i++;
	if(i >= n - 1)
		goto show;
	inside:
		if(j < n - i - 1 && arr[j] > arr[j + 1]) {
			int aux = arr[j];
			arr[j] = arr[j + 1];
			arr[j + 1] = aux;
		}

		j++;
		if(j < n - i + 1)
			goto inside;

		if(!(j >= n - i + 1)) {
			goto bubble;
		}
	
		j = 0;
		goto bubble;

show:
	printf("%d ", arr[k]);
	k++;
	if(k < n)
		goto show;

	return 0;
}
