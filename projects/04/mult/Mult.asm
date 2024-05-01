// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Create intermediate counter variable j and set R2 to 0
    @j
    M=0
    @R2
    M=0
// Loop through adding R0 to R2 R1 times
(LOOP)
// If j <= R1 goto END
    @j
    D=M
    @R1
    D=D-M // D = D-R1
    @END
    D;JGE // if i - R1 == 0 end
// Add R0 to R2
    @R0
    D=M
    @R2
    M=D+M
// Increment j = j + 1
    @j
    M = M + 1
// If j < R1 goto LOOP
    @LOOP
    0;JMP
// Leave Calculation Loop
(END)
    @END
    0;JMP