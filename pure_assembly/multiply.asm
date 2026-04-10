; Program Name: "". This program demonstrates.  Copyright (C) 2026  Dianella Sy

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

; Author Information:
; Name:
; CWID:
; Section: CPSC 240-#
; Email: @csu.fullerton.edu

; Program Information:
; Name:
; Languages:
; Start Date:
; Completion Date:

; Program's Purpose:
; The "" will teach.

; Project Information:
; Files: 
; Developing Computer: 
; Status:

; Translator Information:
; Linux:


global multiply


segment .data


segment .bss


segment .text


multiply:
movsd xmm15, xmm0
movsd xmm14, xmm1

mulsd xmm15, xmm14

movsd xmm0, xmm15
ret