`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & rosswelltiongco@gmail.com
 * Filename: addr_seq.v
 * Date:     October 16, 2017
 * Version:  1.0
 *
 * Description: An 8 bit up counter that continuously increments by a single bit
 * unless a reset is asserted
 *
 *
 ********************************************************************************/
module addr_seq(clk, rst, addr);

   //inputs
   input clk;
   input rst;
	
   //outputs and register
   output [7:0] addr;
   reg [7:0] addr;
   
	//Count up unless a reset is asserted
   always @ (posedge clk, posedge rst) begin
      //if reset is high, addr is set to zero
      if (rst)
         addr <= 8'b0;
      else
         addr <= addr + 1'b1;
   end

endmodule 