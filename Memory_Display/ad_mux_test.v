`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:23:32 10/02/2017
// Design Name:   ad_mux
// Module Name:   C:/Users/Jesus/Documents/Xilinx_Files/CECS301Lab4/ad_mux_test.v
// Project Name:  CECS301Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ad_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ad_mux_test;

	// Inputs
	reg [3:0] d7;
	reg [3:0] d6;
	reg [3:0] d5;
	reg [3:0] d4;
	reg [3:0] d3;
	reg [3:0] d2;
	reg [3:0] d1;
	reg [3:0] d0;
	reg [2:0] sel;

	// Outputs
	wire [3:0] Y;

	// Instantiate the Unit Under Test (UUT)
	ad_mux uut (
		.d7(d7), 
		.d6(d6), 
		.d5(d5), 
		.d4(d4), 
		.d3(d3), 
		.d2(d2), 
		.d1(d1), 
		.d0(d0), 
		.sel(sel), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		d7 = 0011;
		d6 = 0101;
		d5 = 0110;
		d4 = 0111;
		d3 = 1011;
		d2 = 1101;
		d1 = 1110;
		d0 = 1111;
		sel = 000;

		// Wait 100 ns for global reset to finish
		#100;
		sel = 000;
		#10;
		sel = 001;
		#10;
		sel = 010;
		#10;
		sel = 011;
		#10;
		sel = 100;
		#10;
		sel = 101;
		#10;
		sel = 110;
		#10;
		sel = 111;
		#10;
		sel = 000;
		#10;
		sel = 001;
		#10;
		sel = 010;
		#10;
		sel = 011;
		#10;
		sel = 100;
		#10;
		sel = 101;
		#10;
		sel = 110;
		#10;
		sel = 111;
		#10;
		sel = 000;
		#10;
		sel = 001;
		#10;
		sel = 010;
		#10;
		sel = 011;
		#10;
		sel = 100;
		#10;
		sel = 101;
		#10;
		sel = 110;
		#10;
		sel = 111;
		#10;
	end
      
endmodule

