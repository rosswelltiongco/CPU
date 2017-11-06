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
 * operations using nonrepeating, nonzero inputs.
 *
 *******************************************************************************/

module alu16_tb;

	// Declare Inputs
	reg [15:0] R;
	reg [15:0] S;
	reg [3:0] Alu_Op;

	// Declare Outputs
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
   //Begin test sequence
	initial begin
   
		// Initialize Inputs
		R = 0;
		S = 0;
		Alu_Op = 0;

      //ALU Verification test patterns
      R = 16'hAA55; S = 16'h55AA; Alu_Op = 4'h0;      #10; //Pass S
      R = 16'hCCCC; S = 16'h3333; Alu_Op = 4'h1;      #10; //Pass R
      R = 16'hC3C3; S = 16'h3C3C; Alu_Op = 4'h2;      #10; //Increment S
      R = 16'hB4B4; S = 16'h4B4B; Alu_Op = 4'h3;      #10; //Decrement S
      R = 16'hD2D2; S = 16'h2D2D; Alu_Op = 4'h4;      #10; //Add
      R = 16'hE1E1; S = 16'h1E1E; Alu_Op = 4'h5;      #10; //Subtract
      R = 16'hF0F0; S = 16'h0F0F; Alu_Op = 4'h6;      #10; //Logical Right shift S
      R = 16'h1111; S = 16'hEEEE; Alu_Op = 4'h7;      #10; //Logical Left shift
      R = 16'hBBBB; S = 16'h4444; Alu_Op = 4'h8;      #10; //Logical And
      R = 16'hAAAA; S = 16'h5555; Alu_Op = 4'h9;      #10; //Logical Or
      R = 16'h4040; S = 16'h0404; Alu_Op = 4'hA;      #10; //Logical Xor
      R = 16'hF7F7; S = 16'hEFEF; Alu_Op = 4'hB;      #10; //Logical not S (1's comp)
      R = 16'hABCD; S = 16'hDCBA; Alu_Op = 4'hC;      #10; //Negate S (2's comp)
      $finish;
	end
      
endmodule

