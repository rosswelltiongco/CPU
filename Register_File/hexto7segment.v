`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: hexto7segment.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: Module has 4 bit input and uses case statement to convert 4 bit
 * value into a hexadecimal value and output a 7 bit value with corresponding
 * values that control the segments of a 7 segment display to display the
 * hexadecimal value
 *
 *******************************************************************************/
module hexto7segment(Q, disp);
	//declare input
	//input is a 4 bit value
	input [3:0] Q;
	
	//declare output
	//output is a 7 bit value 
	output [6:0] disp;
	
	//register declared for behavioral module
	reg [6:0] disp;
	
	//always statement will change output based on any change in input
	always @ (Q) begin
		casex ({Q[3], Q[2], Q[1], Q[0]})
			//cases for all 16 possible value combinations
			//disp output corresponds to segments in 7 segment display
			//        disp = {A, B, C, D, E ,F ,G}
			4'b0000 : disp = 7'b0000001;
			4'b0001 : disp = 7'b1001111;
			4'b0010 : disp = 7'b0010010;
			4'b0011 : disp = 7'b0000110;
			4'b0100 : disp = 7'b1001100;
			4'b0101 : disp = 7'b0100100;
			4'b0110 : disp = 7'b0100000;
			4'b0111 : disp = 7'b0001111;
			4'b1000 : disp = 7'b0000000;
			4'b1001 : disp = 7'b0001100;
			4'b1010 : disp = 7'b0001000;
			4'b1011 : disp = 7'b1100000;
			4'b1100 : disp = 7'b0110001;
			4'b1101 : disp = 7'b1000010;
			4'b1110 : disp = 7'b0110000;
			4'b1111 : disp = 7'b0111000;
			//default case denotes error and displays 3 row segments
			default : disp = 7'b1001001;
		endcase
	end
	
endmodule
