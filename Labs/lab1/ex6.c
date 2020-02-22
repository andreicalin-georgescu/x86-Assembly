#include <stdio.h>

int f(size_t n, int v[100]) {
	int i = 0;
	while (n) {
	    if (n & 1)
		v[i++] = 1;
	    else
		v[i++] = 0;

	    n >>= 1;
	}
	
	return --i;
	
}

int main() {
	
	    short a = 20000;
	    short b = 14000;
	 
	    short c = a + b; // 1000 0100 1101 0000  = -31536  = a + b adunate fara bitul de semn
			    //0 1000 0100 1101 0000  = 34000
	    unsigned short d = 3 * a + b;
	    short e = a << 1;
	
		long rez = a + b;
		printf("%ld", rez);
	 
	    // TODO
		int v[100] = {0};

		printf("%d %d %d %d %d\n", a, b, c, d, e);
		int n = f(c, v); 
		printf("%d\n", n + 1);
		for(int i = n; i >= 0; i--) {
			printf("%d", v[i]);
			if(i % 4 == 0) printf(" ");
		}
		f(d, v); 

		printf("\n");
		for(int i = n; i >= 0; i--) {
			printf("%d", v[i]);
			if(i % 4 == 0) printf(" ");
		}

		f(e, v);
			printf("\n");
			for(int i = n; i >= 0; i--) {
			printf("%d", v[i]);
			if(i % 4 == 0) printf(" ");
		}
		
	 	
	return 0;
}
