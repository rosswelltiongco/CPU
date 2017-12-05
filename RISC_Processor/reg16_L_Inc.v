`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: reg16_L_Inc.v
 * Date:     December 6, 2017
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

   //inputs
   input               clk, reset, ld, inc;
   input      [15:0]   D;
   
   //outputs and registers
   output reg [15:0]   Q;

   always @ (posedge clk or posedge reset) begin
   //set register value to zero when reset is high
      if (reset)
         Q <= 16'b0;
      else
         case({ld,inc})
              //load input value to register only if ld is high and inc is low
              2'b10: Q <= D;
              //increment current value to register only if inc is high 
              //and ld is low
              2'b01: Q <= Q + 1;
            //any other input causes register to keep same value
            default: Q <= Q;
         endcase
   end
   
endmodule 