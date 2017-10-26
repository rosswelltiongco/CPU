`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: Top_Level.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: FILL ME
 *
 *******************************************************************************/
module Top_Level();


   one_shot( clk_in, reset, Din, Dout );
   
   
   IDP(clk, W_En, W_Adr, S_Adr, R_Adr, DS, S_Sel, ALU_OP,
           C, N, Z, Reg_Out, Alu_Out);


   Display_Controller(clk, reset, 
                             seg7, seg6, seg5, seg4, seg3, seg2, seg1, seg0, 
                               A7,   A6,   A5,   A4,   A3,   A2,   A1,   A0, 
                                a,    b,    c,    d,    e,    f,    g);

endmodule
