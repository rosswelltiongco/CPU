`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: decoder3to8.v
 * Date:     
 * Version:  1.0
 *
 * Description: 3 to 8 decoder <= add more
 * Must be behavioral
 *
 * Work  Time: 15 mins
 * Debug Time: 
 *******************************************************************************/
module decoder3to8( In, en, y7, y6, y5, y4, y3, y2, y1, y0 );
   //declare inputs
   input [2:0] In;
   input en;
   
   //declare outputs
   output y7, y6, y5, y4, y3, y2, y1, y0;
   reg y7, y6, y5, y4, y3, y2, y1, y0;

   always @ (*) begin
      if(en == 1'b1)
         case(In)
            3'b000 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000001;
            3'b001 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000010;
            3'b010 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000100;
            3'b011 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00001000;
            3'b100 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00010000;
            3'b101 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00100000;
            3'b110 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b01000000;
            3'b111 :  {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b10000000;
            default : {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000000;
         endcase
      else
         {y7, y6, y5, y4, y3, y2, y1, y0 } = 8'b00000000;
   end

endmodule
