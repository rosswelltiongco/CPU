`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: decoder3to8.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: Behavioral implementation of a 3-8 decoder that asserts a single
 *	  			    output at any time for any given combination of inputs. If the
 *              chip enable is deactive, the decoder will output 8'b0 by default.
 *
 *******************************************************************************/
module decoder3to8( In, en, y7, y6, y5, y4, y3, y2, y1, y0 );
   //Declare inputs
   input [2:0] In;
   input en;
   
   //Declare outputs and registers
   output reg y7, y6, y5, y4, y3, y2, y1, y0;

   //Changes output based on any change in input
   always @ (*) begin
   //check enable
      if(en == 1'b1)
         case(In)
            3'b000  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000001;
            3'b001  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000010;
            3'b010  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000100;
            3'b011  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00001000;
            3'b100  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00010000;
            3'b101  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00100000;
            3'b110  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b01000000;
            3'b111  : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b10000000;
            //default output is all zeros
            default : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000000;
         endcase
    //outputs all zeros is enable is low     
      else
                      {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000000;
   end

endmodule
