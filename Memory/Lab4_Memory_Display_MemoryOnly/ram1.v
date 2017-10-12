`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Jesus Luciano
 * Email:    jlucian995@gmail.com
 * Filename: ram1.v
 * Date:     
 * Version:  
 *
 * Description:     
 *
 *
 *******************************************************************************/
module ram1(addr, din, clk, we, dout);
	//declare inputs
	input [7:0] addr;
	input [15:0] din;
	//clk from 100Mhz clock
	//we from btn_right debounced
	input clk, we;
	
	//declare output
	output [15:0] dout;

endmodule
