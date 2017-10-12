`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Jesus Luciano
 * Email:    jlucian995@gmail.com
 * Filename: pixel_clk.v
 * Date:     
 * Version:  
 *
 * Description:     
 *
 *
 *******************************************************************************/
module pixel_clk(clk_in, reset, clk_out);
	//declare inputs
	input clk_in, reset;
	
	//declare outputs
	output clk_out;
	reg clk_out;

	//declare variables
	integer i = 0;
	
	always @ (posedge clk_in or posedge reset) begin
		if( reset == 1'b1) begin
			clk_out = 0;
			i = 0;
		end
		else begin
			if(i > 104_166) begin
				clk_out = ~clk_out;
				i = 0;
			end
			else begin
				i = i + 1;
			end
		end
	end
	
	
	
	

endmodule
