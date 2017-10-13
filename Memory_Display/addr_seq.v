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
module addr_seq(clk, rst, addr);
   input clk;
   input rst;
   output reg [7:0] addr;
   
   always @ (posedge clk, posedge rst) begin
      if (rst)
         addr <= 8'b0;
      else
         addr <= addr + 1'b1;
   end

endmodule
