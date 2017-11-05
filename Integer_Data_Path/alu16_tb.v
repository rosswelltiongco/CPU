`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: alu16_tb.v
 * Date:     November 6, 2017
 * Version:  1.0
 *
 * Description: Testbench to test an ALU
 *
 *
 *
 *******************************************************************************/

module alu16_tb;

	// Inputs
	reg [15:0] R;
	reg [15:0] S;
	reg [3:0] Alu_Op;

	// Outputs
	wire [15:0] Y;
	wire N;
	wire Z;
	wire C;

   integer Alu_Counter = 12;

	// Instantiate the Unit Under Test (UUT)
	alu16 uut (
		.R(R), 
		.S(S), 
		.Alu_Op(Alu_Op), 
		.Y(Y), 
		.N(N), 
		.Z(Z), 
		.C(C)
	);
	initial begin
		// Initialize Inputs
		R = 0;
		S = 0;
		Alu_Op = 0;

      //Testing combinational logic
      R = 16'hAA55; S = 16'h55AA; Alu_Op = 4'h0;      #100; //Pass S
      R = 16'hCCCC; S = 16'h3333; Alu_Op = 4'h1;      #100; //Pass R
      R = 16'hC3C3; S = 16'h3C3C; Alu_Op = 4'h2;      #100;


      $finish;
	end
      
endmodule

