`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: 
 * Date:     
 * Version:  1.0
 *
 * Description: 
 *
 *
 * Work  Time: 15 mins Jesus 11/9
 * Debug Time: 
 *******************************************************************************/
module ram7(clk, we, addr, din, dout);
    
    input clk, we;
    input [7:0] addr;
    input [15:0] din; 
    
    output [15:0] dout;

ram_256x16 your_instance_name (
  .clk(clk), // input clk
  .we(we), // input [0 : 0] we
  .addr(addr), // input [7 : 0] addr
  .din(din), // input [15 : 0] din
  .dout(dout) // output [15 : 0] dout
);

endmodule
