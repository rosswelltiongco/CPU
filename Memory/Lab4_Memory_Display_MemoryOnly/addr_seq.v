`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco
 * Email:    rosswelltiongco@gmail.com
 * Filename: addr_seq.v
 * Date:     
 * Version:  1.1
 *
 * Description:     
 *
 *
 ********************************************************************************/
module addr_seq(
   input clk,
   input rst,
   output [7:0] addr
   );

   always @ (posedge clk, posedge rst) begin
      if (rst)
         addr <= 8'b0;
      else
         addr <= addr + 1;
   end

endmodule
