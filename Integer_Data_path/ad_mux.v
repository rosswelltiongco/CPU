`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: ad_mux.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: A four bit 8 to 1 multiplexer that selects address/data
 * information to be displayed based on the pixel controller
 *
 *
 *******************************************************************************/
module ad_mux(d7, d6, d5, d4, d3, d2, d1, d0, sel, Y);

	//declare inputs
	input [3:0] d7;
	input [3:0] d6;
	input [3:0] d5;
	input [3:0] d4;
	input [3:0] d3;
	input [3:0] d2;
	input [3:0] d1;
	input [3:0] d0;
	//declare input for selector
	input [2:0] sel;
	
	//declare outputs
	output reg [3:0] Y;
	
   //any change to any input will cause module to change output
	always @ (*) begin
		case(sel)
			3'b000 : Y = d0;
			3'b001 :	Y = d1;	
			3'b010 :	Y = d2;	
			3'b011 :	Y = d3;
			3'b100 :	Y = d4;
			3'b101 :	Y = d5;
			3'b110 :	Y = d6;
			3'b111 : Y = d7;
			default:	Y = 4'bxxxx; 
		endcase
	end
endmodule 