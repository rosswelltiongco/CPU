`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: clk_500Hz.v
 * Date:     November 6, 2017
 * Version:  2.0
 *
 * Description: Module instantiates clk_divider and one_shot to produce a 
 * one clock length pulse
 *
 *******************************************************************************/
module debounce(clk, reset, Din, Dout);
   //declare inputs
   input clk, reset, Din;
   
   //declare outputs
   output Dout;
   
   //declare wires
   wire clk500_out;

   //clk_500Hz     ( clk_in, reset, clk_out );
   clk_500Hz clk500( clk, reset, clk500_out);

   //one_shot     ( clk_in, reset, Din, Dout );
   one_shot regclk(clk500_out, reset, Din, Dout);

endmodule
