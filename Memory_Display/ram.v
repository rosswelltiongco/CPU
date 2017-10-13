`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco
 * Email:    rosswelltiongco@gmail.com
 * Filename: ram.v
 * Date:     
 * Version:  1.1
 *
 * Description:     
 *
 *
 ********************************************************************************/
module ram(clk, we, addr, din, dout);
   input clk;
   input we;
   input [7:0] addr;
   input [15:0] din;
   output [15:0] dout;

   //FIXME: May be unnecessary
   /*
   always @ (we) begin
      if (we)
         dout <= din;
      else
         dout <= dout;
   end
   */
   
   //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
   ram_256x16 your_instance_name (
  .clka(clk), // input clka
  .wea(we), // input [0 : 0] wea
  .addra(addr),   //Bus  [ 7:0]
  .dina(din),     //Bus  [15:0]
  .douta(dout)    //Bus  [15:0]
   );
   // INST_TAG_END ------ End INSTANTIATION Template ---------

endmodule
