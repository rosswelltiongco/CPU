`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: pixel_clk.v
 * Date:     October 25, 2017
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
	integer i = 32'b0;
	
	/*
	Code divides incoming clock by number specified in 
	"if" conditional statement
	*/

	always @ (posedge clk_in or posedge reset) begin
      //if reset is high, variable reset to zero
		if( reset == 1'b1) begin
			clk_out = 0;
			i = 0;
		end
      //if i is greater than specified value, the output
      //is complemented and counter is reset to zero
      //this "slows" a clock pulse down to
      // board_clock / i / 2 for the frequency
      //of the output clock
		else begin
			if(i > 104_166) begin
				clk_out = ~clk_out;
				i = 0;
			end
         //otherwise, counter increases
			else begin
				i = i + 1;
			end
		end
	end
endmodule
