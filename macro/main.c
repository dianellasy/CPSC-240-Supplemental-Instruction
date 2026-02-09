// Program Name: "". This program demonstrates.  Copyright (C) 2026  Dianella Sy

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

extern double macro_practice();

int main(int argc, char* argv[]) {
    printf("\nWelcome to Macro Practice by Dianella Sy!\n\n");

    double area_of_the_triangle = 0.0;
    area_of_the_triangle = macro_practice();

    printf("\nThe driver has received this number %.5lf, which is the area of the triangle, and will keep it for future use.\n", area_of_the_triangle);
    printf("\nThank you for attending my SI session today! I hope it was helpful!");
    printf("\n\nA zero will be sent to your operating system as a signal of a successful execution.\n");

    return 0;
}