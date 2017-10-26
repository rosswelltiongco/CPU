`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: IDP.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: FILL ME
 *
 *******************************************************************************/
module IDP(clk, W_En, W_Adr, S_Adr, R_Adr, DS, S_Sel, ALU_OP,
           C, N, Z, Reg_Out, Alu_Out);
    
    input clk, W_En, S_Sel;
    input W_En;
    input [2:0] W_Adr, S_Adr, R_Adr;
    input [15:0] DS;
    input [3:0] ALU_OP;
    
    output C, N, Z;
    output [15:0] Reg_Out, Alu_Out;
    
    wire s;


  Register_File(clk, reset, W_Adr, we, R_Adr, S_Adr, W, R, S);
   

  //mux


  //alu16    (R, S, Alu_Op, Y, N, Z, C);
    alu16 ALU(R, S, Alu_Op, Y, N, Z, C);
    
endmodule
