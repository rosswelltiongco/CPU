`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: reg16.v
 * Date:     
 * Version:  1.0
 *
 * Description: Register File <= Add more
 *
 *
 * Work Time: Jesus - 5min writing, no debugging
 *******************************************************************************/
module reg16(clk, reset, ld, Din, DA, DB, oeA, oeB);
    //Declare Inputs
    input         clk, reset, ld, oeA, oeB;
    input [15:0]  Din;
    
    //Declare Registers
    reg   [15:0]  Dout;

    //Declare Outputs
    output [15:0] DA, DB;

    //Behavioral section for writing to the register
   always @ ( posedge clk or posedge reset)
      if(reset)
         Dout <= 16'b0;
      else
         if(ld)
            Dout <= Din;
         else
            Dout <= Dout;
    
    //conditional continuous assignments for reading the register
    assign DA = oeA ? Dout : 16'hz;
    assign DB = oeB ? Dout : 16'hz;


endmodule
