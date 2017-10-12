`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:04:57 10/02/2017
// Design Name:   pixel_controller
// Module Name:   C:/Users/Jesus/Documents/Xilinx_Files/CECS301Lab4/pix_cont_test.v
// Project Name:  CECS301Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pixel_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pix_cont_test;

	// Inputs
	reg clk_480Hz;
	reg reset;

	// Outputs
	wire a7;
	wire a6;
	wire a5;
	wire a4;
	wire a3;
	wire a2;
	wire a1;
	wire a0;
	wire [2:0] seg_sel;

	// Instantiate the Unit Under Test (UUT)
	pixel_controller uut (
		.clk_480Hz(clk_480Hz), 
		.reset(reset), 
		.a7(a7), 
		.a6(a6), 
		.a5(a5), 
		.a4(a4), 
		.a3(a3), 
		.a2(a2), 
		.a1(a1), 
		.a0(a0), 
		.seg_sel(seg_sel)
	);

	initial begin
		// Initialize Inputs
		clk_480Hz = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#10;
		reset = 0;
		// Add stimulus here
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
		clk_480Hz = 1;
		#10;
		clk_480Hz = 0;
		#10;
	
	end
      
endmodule

