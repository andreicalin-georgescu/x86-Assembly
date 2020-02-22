#include <stdio.h>

int main(void)
{
	char cpuid_str[13];

	__asm__ (""
	
	"xor eax, eax\n\t"
	"cpuid\n\t"
	
        "mov [%0], ebx\n\t"
        "mov [%0 + 4], edx\n\t"
        "mov [%0 + 8], ecx\n\t"

	:/* output variable */
	: "r" (cpuid_str)/* input variable */
	: "eax","ebx", "ecx", "edx"); /* registers used in the assembly code */


	cpuid_str[12] = '\0';

	printf("CPUID string: %s\n", cpuid_str);

	return 0;
}
