`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: pixel_controller.v
 * Date:     October 16, 2017
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
	//next state changes only when clock pulse is low since the preset
   //state will be set when clock pulse is high since clk_480Hz acts as
   //both a clock source and an input
	always @(present_state, clk_480Hz)
		casex( {present_state, clk_480Hz} )
         4'bxxx_1 : next_state = present_state;
			//
         4'b000_0 : next_state = 3'b001;
         //
         4'b001_0 : next_state = 3'b010;
         //
         4'b010_0 : next_state = 3'b011;
         //
         4'b011_0 : next_state = 3'b100;
         //
         4'b100_0 : next_state = 3'b101;
         //
         4'b101_0 : next_state = 3'b110;
         //
         4'b110_0 : next_state = 3'b111;
         //
         4'b111_0 : next_state = 3'b000;
			//when clock pulse is high, next_state is not changed to
         //the next value
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
	
	always @( present_state, clk_480Hz)
		casex( {present_state, clk_480Hz} )
         //Mealey finite state machine
         //Output changes based on state and only when clock pulse is
         //high, this means that state will change once every full clock pulse
			4'b000_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111110_000;
         4'b001_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111101_001;
         4'b010_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111011_010;
         4'b011_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11110111_011;
         4'b100_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11101111_100;
         4'b101_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11011111_101;
         4'b110_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b10111111_110;
         4'b111_1  : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b01111111_111;
			default   : {a7, a6, a5, a4, a3, a2, a1, a0, seg_sel} = 11'b11111111_xxx;
		endcase
endmodule 