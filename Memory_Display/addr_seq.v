`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco
 * Email:    rosswelltiongco@gmail.com
 * Filename: addr_seq.v
 * Date:     
 * Version:  1.0
 *
 * Description: An 8 bit up counter that continuously increments by a single bit
 * unless a reset is asserted
 *
 *
 ********************************************************************************/
module addr_seq(clk, rst, addr);
   input clk;
   input rst;
	
   output reg [7:0] addr;
   
	//Count up unless a reset is asserted
   always @ (posedge clk, posedge rst) begin
      if (rst)
         addr <= 8'b0;
      else
         addr <= addr + 1'b1;
   end

endmodule 