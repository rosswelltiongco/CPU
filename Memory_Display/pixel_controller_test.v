`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:16:19 10/02/2017
// Design Name:   pixel_controller
// Module Name:   C:/Users/Jesus/Documents/Xilinx_Files/CECS301Lab4/pixel_controller_test.v
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

module pixel_controller_test;

	// Inputs
	reg clk_480Hz;
	reg reset;

	// Outputs
	reg a7;
	reg a6;
	reg a5;
	reg a4;
	reg a3;
	reg a2;
	reg a1;
	reg a0;
	reg [2:0] seg_sel;

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
		#100;
		clk_480Hz = 0;
		reset = 1;
		#10;
		clk_480Hz = 0;
		reset = 0;
		#10;
		//
		seg_sel = 3'b111;
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
		

	end
      
endmodule

