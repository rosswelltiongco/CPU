`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: one_shot.v
 * Date:     October 23, 2017
 * Version:  1.0
 *
 * Description: Verilog test fixture to test 16 bit register functinoality by
 * reading the contents, writing new values, and reading the recently written
 * values. 
 *
 *******************************************************************************/

module reg16_tb;

	// Inputs
	reg clk;
	reg reset;
	reg ld;
	reg [15:0] Din;
	reg oeA;
	reg oeB;

	// Outputs
	wire [15:0] DA;
	wire [15:0] DB;


	integer address;
	
	// Instantiate the Unit Under Test (UUT)
	reg16 uut (
		.clk(clk), 
		.reset(reset), 
		.ld(ld), 
		.Din(Din), 
		.DA(DA), 
		.DB(DB), 
		.oeA(oeA), 
		.oeB(oeB)
	);

	//Producing a clk
	always #5 clk = ~clk;	
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		ld = 0;
		Din = 0;
		oeA = 0;
		oeB = 0;

		// Add stimulus here
		
		//One time reset assertion
		@ (negedge clk) reset = 1'b1;
		@ (negedge clk) reset = 1'b0;
      
		//Reading the register
		for (address = 0; address < 8; address = address + 1) begin
			@ (negedge clk) begin //Assign ALL inputs on negedge
				DA = Din, DB = 7-Din, w_addr = 0, ld = 0, din = 0, rst = 0;
			end
			@ (posedge clk)  // read on posedge
				#display("T"=%t, Radr = %h, R = %h, Saddr = %h , S = %h
				         # time, R_adr    , R     , Sadr       , S
		end
		
		//Writing pattern to the register
		
		//Reading the pattern
	end
    
endmodule

