`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: ram1.v
 * Date:     October 16, 2017
 * Version:  1.0
 *
 * Description: Ram1 module uses coregen and .coe file provided by instructor
 * to contain data based on file.
 * Memory stars at adress 55 with data FF, as an address value increases, the
 * data address decreases from 55 to 0, and the value FF decreases with it
 *
 *******************************************************************************/
module ram1(
    input clk,
    input we,
    input [7:0] addr,
    input [15:0] din,
    output [15:0] dout
    );
	 
    //ram black box declaration using coregen
   ram_256x16 dut (
      .clka(clk),
      .wea(we), // Bus [0 : 0] 
      .addra(addr), // Bus [7 : 0] 
      .dina(din), // Bus [15 : 0] 
      .douta(dout)); // Bus [15 : 0] 

endmodule
