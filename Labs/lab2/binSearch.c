    #include <stdio.h>
     
    int main()
    {
       int c, first, last, middle, n, search, array[100];
     
       printf("Enter number of elements\n");
       scanf("%d",&n);
     
       printf("Enter %d integers\n", n);
     
       for (c = 0; c < n; c++)
          scanf("%d",&array[c]);
     
       printf("Enter value to find\n");
       scanf("%d", &search);
     
       first = 0;
       last = n - 1;
       middle = (first+last)/2;
     
       // while (first <= last) {
loop:
	
          if (!(array[middle] < search))
		goto skip;
             first = middle + 1; 
skip:
          if (!(array[middle] == search)) 

	goto skip3;
             printf("%d found at location %d.\n", search, middle+1);
             goto ret;
skip3:
          if(!(array[middle] > search))
		goto skip1;
             last = middle - 1;

skip1:
          middle = (first + last)/2;

	  if(first <= last)
		goto loop;
	  if(first > last) 
		goto out;
       

out:
       if (first > last) {
          printf("Not found! %d isn't present in the list.\n", search);
	  goto ret;
	}
ret:
       return 0;  
    }
