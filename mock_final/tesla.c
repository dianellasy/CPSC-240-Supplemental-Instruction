// Author Name: 
// Author Email: 
// Course and Section: 
// Date: 

#include <stdio.h>

extern double electricity();

int main(int argc, char* argv[]) {

    printf("\nWelcome to Palm Beach Electric Company.");

    printf("\nThis software is maintained by Dianella Sy.\n");

    double total_current = electricity();
    
    printf("\nThe main received this number %1.5lf and will keep it for later.\n", total_current);

    printf("A zero will be sent to the operating system. Bye!\n");
    
    return 0;
}