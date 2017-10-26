`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: pixel_controller.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: Generates the signals for the common anode inputs to the
 * 7-segment displays and also generates the multiplexer select signals for
 * multiplexing the address/data nibbles using a finite state machine
 * implementation
 *
 *******************************************************************************/
module pixel_controller(clk_480Hz, reset, a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
	
	//declare input
	//clk from pixel_clk module
	//reset from btn_up debounced
	input clk_480Hz, reset;
	
	//declare outputs for anode selection
	output a7, a6, a5, a4, a3, a2, a1, a0;	
   reg a7, a6, a5, a4, a3, a2, a1, a0;	
   
	//delcare output for segment selection
	output [2:0] seg_sel;
   reg [2:0] seg_sel;
   
////////////////////////////////////////	
	//**********************
	// state register and
	// next_state vairables
	//**********************
	
	reg [2:0] present_state;
	reg [2:0] next_state;
	
	//**********************************************************************
	// Next State Combinational Logic
	// (next state values can change anytime but will only be "clock" below
	//**********************************************************************
	//next_state changes based on value of present state
	always @(present_state)
		casex( present_state )
         3'b000 : next_state = 3'b001;
         //
         3'b001 : next_state = 3'b010;
         //
         3'b010 : next_state = 3'b011;
         //
         3'b011 : next_state = 3'b100;
         //
         3'b100 : next_state = 3'b101;
         //
         3'b101 : next_state = 3'b110;
         //
         3'b110 : next_state = 3'b111;
         //
         3'b111 : next_state = 3'b000;
			default	: next_state = present_state;
		endcase
		
	//*****************************************
	// State Register Logic (Sequential Logic)
	//*****************************************
	always @(posedge clk_480Hz or posedge reset)
		if( reset == 1'b1)
			present_state = 3'b000;
      //present_state changes only on the positive edge of the clock
		else
			present_state = next_state;
	
	//***************************************************************
	// Output Combinational Logic
	// (output values can change whenever an input or state changes)
	//***************************************************************
	always @( present_state)
		casex( present_state )
         //Moore finite state machine
         //Output changes only when present_state value changes at
         //top end of the clock
			3'b000  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111110_000;
         3'b001  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111101_001;
         3'b010  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111011_010;
         3'b011  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11110111_011;
         3'b100  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11101111_100;
         3'b101  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11011111_101;
         3'b110  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b10111111_110;
         3'b111  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b01111111_111;
			default   : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111111_xxx;
		endcase
      
endmodule 