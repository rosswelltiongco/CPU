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
 * Work  Time: Jesus 11/27 1.5 hrs
 * Debug Time: 
 *******************************************************************************/
module top_level_lab8();

   //inputs
   input clk, reset;
   input dump_mem, step_clk, step_mem, dump_mem;
   
   //outputs
   output [7:0] an;
   output a,b,c,d,e,f,g;
   output [7:0] status;//status LEDs
   
   //wires
   wire mem_dump_out, step_clk_out, step_mem_out, adr_mux, mw_en;
   wire [15:0] Address, CPU_D_out, RAM_D_out;

//module debounce(clk, reset, Din, Dout);
   debounce stepclk(clk, reset, step_clk, step_clk_out);
   debounce stepmem(clk, reset, step_mem, step_mem_out);


//     RISC_PROCESSOR(         clk, reset,      D_in, mw_en, status, Address,     D_out);
   RISC_PROCESSOR cpu(step_clk_out, reset, RAM_D_out, mw_en, status, Address, CPU_D_out);

//module reg16_L_Inc           (         clk, reset,   ld,      inc,     D,            Q); use for mem dump counter
   reg16_L_Inc Mem_Dump_Counter(step_mem_out, reset, 1'b0, dump_mem, 16'b0, mem_dump_out);

   assign adr_mux = dump_mem ? mem_dump_out : Address;//address from RISC
//module  ram(clk,    we,          addr,       din,      dout);
   ram memory(clk, mw_en,Address [7:0], CPU_D_out, RAM_D_out);


//module Display_Controller(clk, reset, 
//                          seg7, seg6, seg5, seg4, seg3, seg2, seg1, seg0, 
//                            A7,   A6,   A5,   A4,   A3,   A2,   A1,   A0, 
//                             a,    b,    c,    d,    e,    f,    g);
   Display_Controller(clk, reset, 
                        adr_mux[15:12], adr_mux[11:8], adr_mux[7:4], adr_mux[3:0],
                        Address[15:12], Address[11:8], Address[7:4], Address[3:0],
                        an[7], an[6], an[5], an[4], an[3], an[2], an[1], an[0],
                        a,b,c,d,e,f,g);
                      

endmodule
