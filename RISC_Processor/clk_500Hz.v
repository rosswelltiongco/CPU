`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: clk_500Hz.v
 * Date:     November 27, 2017
 * Version:  2.0
 *
 * Description: Module takes clock input from the Nexys 4 board clock and   
 * uses a counter to slow down output clock pulse by complementing clock output
 * once counter reaches a specific value, increasing with every clock pulse
 *
 *******************************************************************************/
module clk_500Hz( clk_in, reset, clk_out );
   //inputs
	input clk_in, reset;
   
   //outputs
	output clk_out;
   
   //registers
	reg clk_out;
   
   //variables
	integer i;
	
	/*
	Code divides incoming clock by number specified in 
	"if" conditional statement
	*/
	always @ (posedge clk_in or posedge reset) begin
		//sets outputs to zero when reset is active
		if (reset == 1'b1) begin
			i = 0;
			clk_out = 0;
		end
		
		else begin
      //variable increases with every clock input
			i = i + 1;
         //once variable reaches certain value, clock is
         //complemented and variable is reset to 0
			if (i >= 100_000 ) begin
				clk_out = ~clk_out;
				i = 0;
			end//if
		end//else
	end//always
endmodule

