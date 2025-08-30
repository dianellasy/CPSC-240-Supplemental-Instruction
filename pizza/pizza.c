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
#include <math.h>

extern double make_pizza();
extern void ingredients(int count1, const char* ingredient_one,
                        int count2, const char* ingredient_two,
                        int count3, const char* ingredient_three,
                        double price, double tax);

int main() {
    printf("\nLet's make some pizza!\n\n");

    // Call C Function ingredients
    // ingredients(5, "Tomato", 7, "Cheese", 3, "Pepperoni", 10.0, 0.1);

    // Call Assembly Function make_pizza
    make_pizza();

    double cosine = make_pizza();
    printf("cos(60) = %1.1lf", cosine);

    printf("\nPizza is ready!\n");

    return 0;
}

// A function named ingredients which prints a list of ingredients and its count
void ingredients(int count1, const char* ingredient_one,
                 int count2, const char* ingredient_two,
                 int count3, const char* ingredient_three,
                 double price, double tax)
{
    double total = price + price * tax;
    printf("Ingredients:\n%dx %s\n%dx %s\n%dx %s\nPrice: %lf\nTax: %lf\nTotal: %lf\n",
           count1, ingredient_one, count2, ingredient_two, count3, ingredient_three, price, tax, total);
}