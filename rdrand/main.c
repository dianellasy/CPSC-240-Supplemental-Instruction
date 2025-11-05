// Program Name: "". This program demonstrates.  Copyright (C) 2025  Dianella Sy

// This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
// version 3 as published by the Free Software Foundation.                                                                    
// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied        
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
// A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

// Author Information:
// Name:
// CWID:
// Section: CPSC 240-#
// Email: @csu.fullerton.edu

// Program Information:
// Name:
// Languages:
// Start Date:
// Completion Date:

// Program's Purpose:
// The "" will teach/introduce.

// Project Information:
// Files: 
// Developing Computer: 
// Status:

// Translator Information:
// GNU Compiler:
// GNU Linker:

// Execution:
// ./go.out

#include <stdio.h>

extern int random_number();

int main(int argc, char* argv[]) {

    printf("\nWelcome to Dianella's SI Session! 🤗\n");
    
    int return_rdrand = random_number();

    printf("Your random number is %d\n", return_rdrand);
    
    printf("A zero will be returned to the operating system.\n");

    printf("Thank you for attending my SI session! I hope this helped 🩷\n");

    return 0;
}