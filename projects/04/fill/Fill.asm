// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// Pointer to Memory location for keyboard map
@8192 // (512*32)/16
D = A
@board
M = D

(LOOP)
// Set pixel array index counter to 0
    @i
    M = 0
(CHECK)
// If key != pressed
// GOTO set Pixel WHITE
    @KBD
    D=M
    @WHITE
    D;JEQ   // goto WHITE if KBD value is 0

(BLACK)
// SET pixel to black
    // if counter = end of pixel length skip increment - GOTO LOOP
    // GOTO END
    @i
    D=M

    @SCREEN
    // Find current address
    A=A+D   
    // Fill with black
    M=-1    
    @END
    0;JMP   // goto END

(WHITE)
// SET pixel to white
    @i
    D=M
    @SCREEN
    A=A+D
    M = 0

(END)
    // increment index counter
    @i
    MD = M + 1
    // decrement board counter
    @board
    D = D - M
    // goto LOOP if the character set in board - i == 0
    @LOOP
    D;JEQ   
    // goto INNER
    @INNER
    0;JMP   

