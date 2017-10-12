`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Jesus Luciano
 * Email:    jlucian995@gmail.com
 * Filename: clk_500Hz.v
 * Date:     October 4, 2017
 * Version:  2.0
 *
 * Description: Module takes clock input from the Nexys 4 board clock and   
 * uses a counter to slow down output clock pulse by complementing clock output
 * 
 *
 *******************************************************************************/
module clk_500Hz( clk_in, reset, clk_out );

	input clk_in, reset;
	output clk_out;
	reg clk_out;
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
			i = i + 1;
			if (i >= 100_000 ) begin
				clk_out = ~clk_out;
				i = 0;
			end//if
		end//else
	end//always
endmodule

