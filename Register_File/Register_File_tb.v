`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: Register_File_tb.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: Verilog test fixture to test register file functinoality by
 * reading the contents of a register, writing new values, and reading the newly
 * written values. 
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

	integer address;
	
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
	
	//Producing a clk that toggles at half the desired clock time
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

		//One time reset assertion
		@ (negedge clk) reset = 1'b1;
		@ (negedge clk) reset = 1'b0;
		
		
		//Reading the register
		for (address = 0; address < 8; address = address + 1) begin
			//Assigning ALL INPUTS on the negative edge of clk
			@ (negedge clk)
				R_Adr = address; S_Adr = 7 - address; 
            W_Adr = 0; we = 0; W = 0; reset = 0;
			//Reading values on the positive edge of clk
			@ (posedge clk)
				$display("T=%t, R_Adr = %h, R_Adr = %h, S_Adr = %h  , S = %h",
				         $time, R_Adr     , R         , S_Adr       , S      );
		end
		
		
		//Writing pattern to the register file
		for (address = 0; address < 8; address = address + 1) begin
			//Assigning ALL INPUTS on the negative edge of clk
			@ (negedge clk)
				R_Adr = 0; S_Adr = 0; W_Adr = address; 
            we = 1; W = ~address; reset = 0;
			//No display needed since we are writing to register
		end
		
		//Reading the pattern
		for (address = 0; address < 8; address = address + 1) begin
			//Assigning ALL INPUTS on the negative edge of clk
			@ (negedge clk)
				R_Adr = address; S_Adr = 7 - address; 
            W_Adr = 0; we = 0; W = 0; reset = 0;
			//Reading on the positive edge of clk
			@ (posedge clk)
				$display("T=%t, R_Adr = %h, R_Adr = %h, S_Adr = %h  , S = %h",
				         $time, R_Adr     , R         , S_Adr       , S      );
		end		

	end  
	
endmodule

