`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: reg16_L_Inc.v
 * Date:     November 27, 2017
 * Version:  1.0
 *
 * Description: A 16 bit register with load and incrementation capabilities.
 * The load signal will load a 16 bit value into the register, based on it's 
 * input D. The inc signal will cause the register to increase its current 
 * value by 1. Only one of the load and increment control signals can be 
 * set to high, otherwise the Register's value does not change. 
 *
 *******************************************************************************/
module reg16_L_Inc(clk, reset, ld, inc, D, Q);
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
            default: Q <= Q;
         endcase
   end
   
endmodule 