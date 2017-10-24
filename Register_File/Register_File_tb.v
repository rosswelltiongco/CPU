`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: Register_File.tb
 * Date:     October 23, 2017
 * Version:  1.0
 *
 * Description: Verilog test fixture to test 16 bit register functinoality by
 * reading the contents, writing new values, and reading the recently written
 * values. 
 *
 *******************************************************************************/

module Register_File_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [2:0] W_Adr;
	reg we;
	reg [2:0] R_Adr;
	reg [2:0] S_Adr;
	reg [15:0] W;

	// Outputs
	wire [15:0] R;
	wire [15:0] S;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.clk(clk), 
		.reset(reset), 
		.W_Adr(W_Adr), 
		.we(we), 
		.R_Adr(R_Adr), 
		.S_Adr(S_Adr), 
		.W(W), 
		.R(R), 
		.S(S)
	);
	
	integer address;
	
	//Producing a clk
	always #5 clk = ~clk;	

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		W_Adr = 0;
		we = 0;
		R_Adr = 0;
		S_Adr = 0;
		W = 0;

		// Wait 100 ns for global reset to finish
				//One time reset assertion
		@ (negedge clk) reset = 1'b1;
		@ (negedge clk) reset = 1'b0;
		
		//Reading the register
		for (address = 0; address < 8; address = address + 1) begin
			@ (negedge clk) begin //Assign ALL inputs on negedge
				R_Adr = address; S_Adr = 7 - address; W_Adr = 0; we = 0; W = 0; reset = 0;
			end
			@ (posedge clk)// read on posedge
				$display("T=%t, Radr = %h, R = %h, S_Adr = %h  , S = %h",
				         $time, R_Adr    , R     , S_Adr       , S      );
		end
		
		
		//Writing pattern to the register
		for (address = 0; address < 8; address = address + 1) begin
			@ (negedge clk) begin //Assign ALL inputs on negedge
				R_Adr = 0; S_Adr = 0 - address; W_Adr = ~address; we = 1; W = 0; reset = 0;
			end
			//No display needed since we are writing to register
		end
		
		//Reading the pattern
		for (address = 0; address < 8; address = address + 1) begin
			@ (negedge clk) begin //Assign ALL inputs on negedge
				R_Adr = address; S_Adr = 7 - address; W_Adr = 0; we = 0; W = 0; reset = 0;
			end
			@ (posedge clk)// read on posedge
				$display("T=%t, Radr = %h, R = %h, S_Adr = %h  , S = %h",
				         $time, R_Adr    , R     , S_Adr       , S      );
		end		

	end   
endmodule

