`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: reg16.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: A 16 bit register with a 16 bit load that outputs 
 *              DA or DB whenever their corresponding inputs are enabled in order
 *              to prevent bus contention.
 *
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
      //If reset is asserted, set register to 0
      if(reset)
         Dout <= 16'b0;
      //If reset is unasserted, Dout will load Din whenever the load is active
      else
         if(ld)
            Dout <= Din;
         else
            Dout <= Dout;
    
    //conditional continuous assignments for reading the register with tri-state
    assign DA = oeA ? Dout : 16'hz;
    assign DB = oeB ? Dout : 16'hz;

endmodule
