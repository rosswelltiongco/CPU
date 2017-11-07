`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: reg16.v
 * Date:     November 6, 2017
 * Version:  1.0
 *
 * Description: A 16 bit register with load and incrementation capabilities.
 *
 *******************************************************************************/
module reg16_L_Inc(clk, reset, ld, inc, D, q);
   input               clk, reset, ld, inc;
   input      [15:0]   D;
   output reg [15:0]   Q;

   always @ (posedge clk or posedge reset) begin
      if (reset)
         Q <= 16'b0;
      else
         case({ld,inc})
              2'b10: Q <= D;
              2'b01: Q <= Q + 1;
            default: Q <= D;
         endcase
   end
   
endmodule 