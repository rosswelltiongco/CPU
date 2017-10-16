`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: pixel_clk.v
 * Date:     October 16, 2017
 * Version:  1.0
 *
 * Description:  A 480 Hz clock divider used to time multiplex the common
 * anode inputs to the 7-segment displays
 *
 *******************************************************************************/
module pixel_clk(clk_in, reset, clk_out);
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
			if (i >= 104_166 ) begin
				clk_out = ~clk_out;
				i = 0;
			end//if
		end//else
	end//always
endmodule
