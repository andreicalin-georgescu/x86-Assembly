#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {
	char str1[] = "\x4c\x26\xe3\xb4\x4c\x86\xc2\x1e\xf8\x90\x89\x70\xc7\xaf\x74\x75\xc1\x7e\x83\x4c\x7c\x01\xaa\x70\x2e\x77";

	char str2[] = "\x00\x43\x82\xc6\x22\xa6\xb6\x71\xd8\xe5\xfa\x15\xe7\xc7\x11\x0d\xe1\x07\xec\x39\x5c\x6c\xdf\x03\x5a\x56";
	//aux = str1 ^ str2;
	//printf("%c \n\n", str2[]);

	int len = strlen(str1);
	printf("%d %d\n", len, strlen(str2));

	char out[] = "";
	for(int i = 0; i <= len; i++) {
		out[i] = str1[i] ^ str2[i];
		//printf("%d ", str2[i]);
	}

	printf("%s\n", out);
	return 0;
}
