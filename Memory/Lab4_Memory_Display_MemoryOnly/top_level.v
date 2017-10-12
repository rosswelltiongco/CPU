`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Jesus Luciano
 * Email:    jlucian995@gmail.com
 * Filename: top_level.v
 * Date:     
 * Version:  
 *
 * Description:     
 *
 *
 *******************************************************************************/
module top_level(clk, reset, anode7, anode6, anode5, anode4, anode3, anode2,anode1, anode0, display, sw );
	input clk, reset;
	output anode7, anode6, anode5, anode4, anode3, anode2,anode1, anode0;
	output [6:0] display;
	
   input [3:0] sw;
   
	wire pixel_clk_out;
	wire [2:0] seg_sel; 
	wire [3:0] Q;
	//one_shot( clk_in, reset, Din, Dout );
	wire [3:0] disp7;
	wire [3:0] disp6;
	wire [3:0] disp5;
	wire [3:0] disp4;
	wire [3:0] disp3;
	wire [3:0] disp2;
	wire [3:0] disp1;
	wire [3:0] disp0;
	
	assign disp7 = 4'b1111;
	assign disp6 = 4'b1110;
	assign disp5 = 4'b1101;
	assign disp4 = 4'b1100;
	assign disp3 = 4'b1011;
	assign disp2 = 4'b1010;
	assign disp1 = 4'b1001;
	assign disp0 = sw;
	
	//pixel_clk(clk_in, reset, clk_out);
	pixel_clk pixel(clk, reset, pixel_clk_out);
	
	//pixel_controller(clk_480Hz, reset, a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
	pixel_controller pxl_ctrl(pixel_clk_out, reset, anode7,anode6,anode5,anode4,anode3,anode2,anode1,anode0, seg_sel);
	
	//ad_mux(d7, d6, d5, d4, d3, d2, d1, d0, sel, Y);
	ad_mux ad(disp7,disp6,disp5,disp4,disp3,disp2,disp1,disp0, seg_sel, Q);

	//hexto7segment(Q, disp);
	hexto7segment hex(Q, display);
	
endmodule
