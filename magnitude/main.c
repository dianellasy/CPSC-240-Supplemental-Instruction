// Name: 
// Email: @csu.fullerton.edu
// Date: 
// Course ID: CPSC 240-
// Statement of Purpose: Driver Program (main.c)

#include <stdio.h>

extern double manager();

int main(int argc, char* argv[]) {

    printf("\nWelcome to Dianella's 'Magnitude Program'!\n");
    
    double return_magnitude = manager();

    printf("\nThe main function received this number %1.5lf, and will keep it for a while.\n", return_magnitude);
    
    printf("Have a good day.\n");

    return 0;
}