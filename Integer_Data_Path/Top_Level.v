`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:58 10/25/2017 
// Design Name: 
// Module Name:    Top_Level 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top_Level();


   one_shot( clk_in, reset, Din, Dout );
   
   
   IDP(clk, W_En, W_Adr, S_Adr, R_Adr, DS, S_Sel, ALU_OP,
           C, N, Z, Reg_Out, Alu_Out);


   Display_Controller(clk, reset, 
                             seg7, seg6, seg5, seg4, seg3, seg2, seg1, seg0, 
                               A7,   A6,   A5,   A4,   A3,   A2,   A1,   A0, 
                                a,    b,    c,    d,    e,    f,    g);

endmodule
