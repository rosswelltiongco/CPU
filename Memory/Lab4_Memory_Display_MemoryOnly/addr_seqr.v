`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Jesus Luciano
 * Email:    jlucian995@gmail.com
 * Filename: addr_seqr.v
 * Date:     
 * Version:  
 *
 * Description:     
 *
 *
 *******************************************************************************/
module addr_seqr(clk, reset, addr);
	//declare inputs
	//clk from 8 bit counter from btn_down, so debounced
	input clk ,reset;

	//delcare outputs
	output [7:0] addr;
	
	
endmodule
