`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: IDP.v
 * Date:     November 27, 2017
 * Version:  1.0
 *
 * Description: Integer Datapath Module instantiates a 8x16 bit register file,
 * a 16 bit arithmetic logic unit and a 2to1mux. One of the ALU's inputs comes
 * from one of the register file's outputs. The other input is slected by a
 * 2to1 mux that chooses between the register file's other output or an 
 * external output. The module outputs a 32 bit out, with 16 coming from the
 * register file's output going into the ALu and the other from the ALU's
 * output.
 *
 *******************************************************************************/
module IDP(clk, W_En, W_Adr, S_Adr, R_Adr, DS, S_Sel, ALU_OP, reset,
           C, N, Z, Reg_Out, Alu_out);
    
    //declare inputs
    input clk, W_En, S_Sel, reset;
    input [2:0] W_Adr, S_Adr, R_Adr;
    input [15:0] DS;
    input [3:0] ALU_OP;
    
    //delcare outputs
    output C, N, Z;
    output [15:0] Reg_Out, Alu_out;
    
    //declare wires
    wire [15:0] smux, S;

  //Register_File        (clk, reset, W_Adr,   we, 
    Register_File regfile(clk, reset, W_Adr, W_En, 
  //                      R_Adr, S_Adr,        W,       R, S);
                          R_Adr, S_Adr,  Alu_out, Reg_Out, S);
   

    //mux - continuous assign statement implements 16 bit 2to1 mux
    assign smux = S_Sel ? DS : S;

    //alu16  (      R,    S, Alu_Op,       Y, N, Z, C);
    alu16 ALU(Reg_Out, smux, ALU_OP, Alu_out, N, Z, C);
    
endmodule
