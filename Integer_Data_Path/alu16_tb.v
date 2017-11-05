`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: alu16_tb.v
 * Date:     November 6, 2017
 * Version:  1.0
 *
 * Description: Testbench to verify ALU all 12 of ALU's logical and arithmetic
 *              operations
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

      //ALU Verification test patterns
      R = 16'hAA55; S = 16'h55AA; Alu_Op = 4'h0;      #100; //Pass S
      R = 16'hCCCC; S = 16'h3333; Alu_Op = 4'h1;      #100; //Pass R
      R = 16'hC3C3; S = 16'h3C3C; Alu_Op = 4'h2;      #100; //Increment S
      R = 16'hB4B4; S = 16'h4B4B; Alu_Op = 4'h3;      #100; //Decrement S
      R = 16'hD2D2; S = 16'h2D2D; Alu_Op = 4'h4;      #100; //Add
      R = 16'hE1E1; S = 16'h1E1E; Alu_Op = 4'h5;      #100; //Subtract
      R = 16'hF0F0; S = 16'h0F0F; Alu_Op = 4'h6;      #100; //Logical Right shift S
      R = 16'h1111; S = 16'hEEEE; Alu_Op = 4'h7;      #100; //Logical Left shift
      R = 16'hBBBB; S = 16'h4444; Alu_Op = 4'h8;      #100; //Logical And
      R = 16'hAAAA; S = 16'h5555; Alu_Op = 4'h9;      #100; //Logical Or
      R = 16'h4040; S = 16'h0404; Alu_Op = 4'hA;      #100; //Logical Xor
      R = 16'hF7F7; S = 16'hEFEF; Alu_Op = 4'hB;      #100; //Logical not S (1's comp)
      R = 16'hABCD; S = 16'hDCBA; Alu_Op = 4'hC;      #100; //Negate S (2's comp)
      $finish;
	end
      
endmodule

