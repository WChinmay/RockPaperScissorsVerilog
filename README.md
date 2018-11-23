# RockPaperScissorsVerilog
This project enables two users to play a game of Rock Paper Scissors using a 8 button push board and a seven segment LED display.
The game is coded in *System Verilog*.

### The Button Board
Each player gets 3 buttons on the board. The buttons 1, 2 and 3 stand for Rock Paper Scissor respectively. The players press and hold on to a button to indicate their selection.

### The Seven Segment LED Display
The LED display flashes **1** if Player 1 wins and **2** if Player 2 wins. If it is a draw the LED display will show a **-**. If either player presses more than one button, the LED diplay will flash **0**. This indicates that the specific play is invalid.

### Game Logic
The game logic code can be found in the [Multiplexer](https://github.com/WChinmay/RockPaperScissorsVerilog/blob/master/impl1/source/Multiplexer.sv) module.
