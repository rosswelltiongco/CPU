`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: ram.v
 * Date:     December 6, 2017
 * Version:  1.0
 *
 * Description: Ram module instantiates a memory module using coregen. The value
 * in the ram are specified by the file "ram_256x16_lab7Fa17.coe" given by
 * the instructor that contained control signals for use in our Execution Unit
 *
 *******************************************************************************/
module ram(clk, we, addr, din, dout);
    //inputs
    input         clk, we;
    input  [7:0]  addr;
    input  [15:0] din; 
    
    output [15:0] dout;

    ram_256x16 main_memory (
        .clka(clk), // input clka
        .wea(we), // input [0 : 0] wea
        .addra(addr), // input [7 : 0] addra
        .dina(din), // input [15 : 0] dina
        .douta(dout) // output [15 : 0] douta
    );

endmodule
