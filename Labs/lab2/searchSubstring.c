#include <string.h>
#include <stdio.h>

int main() {
	char str[] = "abcgdefb";
	char substr[] = "fbu";

	int i = 0, j = 0;
	int len1 = strlen(str);
	int len2 = strlen(substr);
	// printf("len1 = %d len2 = %d\n", len1, len2);

search:
	// printf("i = %d j = %d\n", i, j);

	i++;
	j++;

	if(i < len1 && j < len2 && str[i] == substr[j]) {
		// i++;
		// j++;
		goto search;
	}

	if(!(i < len1 && j < len2 && str[i] != substr[j]))
		goto skip;
	{
		j = 0;
		i++;
		goto search;
	}

skip:
	if(j == len2 && j != 0)
		goto show_yes;
	if(j > len2 || i >= len1)
		goto show_no;

show_yes:
	printf("Se gaseste. "); //strat at  i - len2;
	return 0;
show_no:
	printf("Nu se gaseste subst in str. ");
	return 0;

	printf("\n%d %d %d\n", i, j, len2);
	return 0;
}
