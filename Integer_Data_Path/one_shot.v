`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: one_shot.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: Debounces a signal and only outputs high when 9 of 
 * its 10 inputs have been high, which means that a button push signal has
 * stabilized to a value of 1;
 *
 *******************************************************************************/
module one_shot( clk_in, reset, Din, Dout );
	//delcare inputs
	//Din is data in
	input clk_in, reset, Din;
	
	//declare outputs
	//Dout is data to be output
	output Dout;
	
	//registers to hold incoming values
	reg q9, q8, q7, q6, q5, q4, q3, q2, q1, q0;
	
	always @ (posedge clk_in or posedge reset)
		//sets output to zero if reset is high
		if( reset == 1'b1) begin
			//sets all register values to 0
			{q9,q8,q7,q6,q5,q4,q3,q2,q1,q0} <= 10'b0;
		end
		else begin
			//shifts all register values to the left, with the 0 bit register
			//having Din value as its input
			q9 <= q8; q8 <= q7; q7 <= q6; q6 <= q5; q5 <= q4; q4 <= q3;
			q3 <= q2; q2 <= q1; q1 <= q0; q0 <= Din;
		end
		//sets Dout to 1 when 9 of the 10 inputs are 10, this creates
      //a single high pulse for one clock cycle since the next value
      //to be set to q9 is 1 since all values are shifted to the left
		assign Dout = !q9 & q8 & q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;
		
endmodule
