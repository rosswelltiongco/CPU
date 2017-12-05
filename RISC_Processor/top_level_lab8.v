`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: top_level_lab8.v
 * Date:     December 6, 2017
 * Version:  1.0
 *
 * Description: Top level module instantiates 2 button debounces and a completed
 * 16 bit RISC processor. This processor is then connected to a 256x16 RAM
 * module to pull instructions from. The input and output of the memory module
 * are then connected to a display controller module which displays to the
 * seven segments displays of the Nexys4 board. An additional register is also
 * instantiated and connected to a button and switch input that can select it to
 * step through the contents of memory.
 *
 *******************************************************************************/
module top_level_lab8(clk, reset, dump_mem, step_clk, step_mem,
                      an, a, b, c, d, e, f, g, status);

   //inputs
   input        clk, reset;
   input        dump_mem, step_clk, step_mem;
   
   //outputs
   output       a,b,c,d,e,f,g;
   output [7:0] an, status;
   
   //wires
   wire        step_clk_out, step_mem_out, mw_en;
   wire [15:0] Address, CPU_D_out, RAM_D_out, adr_mux,  mem_dump_out;

   //      debounce(clk, reset,      Din,         Dout);
   debounce stepclk(clk, reset, step_clk, step_clk_out);
   debounce stepmem(clk, reset, step_mem, step_mem_out);


   //  RISC_PROCESSOR(         clk, reset,      D_in, mw_en, 
   RISC_PROCESSOR cpu(step_clk_out, reset, RAM_D_out, mw_en, 
   //                 status, Address,     D_out);
                      status, Address, CPU_D_out);

   //               reg16_L_Inc(         clk, reset,   ld,      inc,
   reg16_L_Inc Mem_Dump_Counter(step_mem_out, reset, 1'b0, dump_mem, 
   //                               D,            Q);
                                16'b0, mem_dump_out);

   //adr_mux controlled by dump_mem switch to select between Mem_Dump_Counter
   //RISC_PROCESSOR as the address to RAM
   assign adr_mux = dump_mem ? mem_dump_out : Address;
   
   //     ram(clk,    we,        addr,       din,      dout);
   ram memory(clk, mw_en,adr_mux[7:0], CPU_D_out, RAM_D_out);


   // Display_Controller  (clk, reset, 

   Display_Controller disp(clk, reset, 
   //              seg7,          seg6,         seg5,         seg4,          
         adr_mux[15:12], adr_mux[11:8], adr_mux[7:4], adr_mux[3:0],
   //                seg3,            seg2,           seg1,           seg0,     
         RAM_D_out[15:12], RAM_D_out[11:8], RAM_D_out[7:4], RAM_D_out[3:0],
   //       A7,    A6,    A5,    A4,    A3,    A2,    A1,    A0,          
         an[7], an[6], an[5], an[4], an[3], an[2], an[1], an[0],
   //    a, b, c, d, e, f, g);
         a, b, c, d, e, f, g);
                      

endmodule
