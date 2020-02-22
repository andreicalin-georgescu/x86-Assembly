#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(){

    int i = 0, s;
    int MAX = 4;
    for (i = 0; i<MAX; i++){
        //printf("dec val= %d\n", val);
        //printf("hex val= %02x\n", val);
    }
    char *hexstr = "004382c622a6b671d8e5fa15e7c7110de107ec395c6cdf035a56";
    char *substr = (char*)malloc(3);
    char *ptr = hexstr;
	char str1[100] = "", str2[100] = "";  //daca las str2[] = "" la rulare da stack smashing detected
	int k = 0;

    //for (i = 0; i< (int)strlen(hexstr) && strlen(ptr) != 0; i+1)
	while(strlen(ptr) != 0){
        strncpy(substr, ptr, 2);
        s = strtol(substr, NULL, 16);
	//printf("%d ", s);
	str1[k] = s; k++;
        ptr= ptr+2;
	
    }
	str1[k] = '\0';
    
	k = 0;
	ptr = "4c26e3b44c86c21ef8908970c7af7475c17e834c7c01aa702e77"; //si nu *ptr
	while(strlen(ptr) != 0) {
		strncpy(substr, ptr, 2);
		s = strtol(substr, NULL, 16);
		//printf("%d ", s);
		str2[k++] = s;
		ptr = ptr + 2;
	}

	str2[k] = '\0';
	//printf("%s\n", str1);

	int len = strlen(hexstr);

	char out[] = "";
	for(int i = 0; i < len; i++) {
		out[i] = str2[i] ^ str1[i];
		//printf("%d ", str1[i]);
	}
	//out[i + 1] = '\0';  - cu asta aparea doar Learn
	printf("%s\n", out);
	
    return 0;
}
