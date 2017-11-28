`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: cu.v
 * Date:     
 * Version:  1.0
 *
 * Description: A "Moore" finite state machine that implements the major cycles
 * fetching and executing instructions for the 301 16-bit RISC processor
 *
 * Work  Time: 1.5hr Jesus 11/27
 * Debug Time: 
 *******************************************************************************/
module cu(clk, reset, IR, N, Z, C,
          W_Adr, R_Adr, S_Adr,
          adr_sel, s_sel,
          pc_ld, pc_Inc, pc_sel, ir_ld,
          mw_en, rw_en, alu_op,
          status);

   //inputs
   input        clk, reset;   //clock and reset
   input [15:0] IR;           //instruction register input
   input        N, Z, C;
   
   //outputs
   output [2:0] W_Adr, R_Adr, S_Adr;
   output       adr_sel, s_sel;
   output       pc_ld, pc_inc, pc_sel, ir_ld;
   output       mw_en, rw_en; //memory_write, register_file write
   output [3:0] alu_op;
   output [7:0] status; //8 LED outputs to display current state
   
   
   /***************************
   *     data structures      *
   ***************************/
   reg [2:0] W_Adr, R_Adr, S_Adr;
   reg       adr_sel, s_sel;
   reg       pc_ld, pc_inc;
   reg       pc_sel, ir_ld;
   reg       mw_en, rw_en;
   reg [3:0] alu_op;
   
   reg [4:0] state;
   reg [4:0] nextstate;
   reg [7:0] status; //led status/ state outputs
   reg ps_N, ps_Z, ps_C; //present state flags
   reg ns_N, ns_Z, ns_C; //next state flags

   parameter RESET=0, FETCH=1, DECODE=2,
             ADD=3, SUB=4, CMP=5, MOV=6,
             INC=7, DEC=8, SHL=9, SHR=10,
             LD=11, STO=12, LDI=13,
             JE=14, JNE=15, JC=16, JMP=17,
             HALT=18,
             ILLEGAL_OP=31;
             
   /**********************************
   *  301 Control Unit Sequencer     *
   **********************************/
   
   //synchronous state register assignment
   always @(posedge clk or posedge reset)
      if(reset)
         state = RESET;
      else
         state = nextstate;
   
   //synchronous lags register assignment
   always @(posedge clk or posedge reset)
      if(reset)
         {ps_N, ps_Z, ps_C} = 3'b0;
      else
         {ps_N, ps_Z, ps_C} = {ns_N, ns_Z, ns_C};
         
         
   //combinational logic section for both next state logic
   //and control word outputs for cpu_execution_unit and memory
   always @( state )
      case( state )
         RESET: begin 
         // Default Control Word Values -- LED pattern = 1111_1111
         W_Adr   = 3'b000;
         R_Adr   = 3'b000;
         S_Adr   = 3'b000;
         adr_sel = 1'b0;
         s_sel   = 1'b0;
         pc_ld   = 1'b0;
         pc_inc  = 1'b0;
         pc_sel  = 1'b0;
         ir_ld   = 1'b0;
         mw_en   = 1'b0;
         rw_en   = 1'b0;
         alu_op  = 4'b0000;
         {ns_N, ns_Z, ns_C} = 3'b0;
         status  = 8'hFF;
         nextstate = FETCH;
         
         end//RESET
         
         FETCH: begin 
         // IR <-- M[PC], PC <- PC+1 -- LED pattern = 1000_0000
         W_Adr   = 3'b000;
         R_Adr   = 3'b000;
         S_Adr   = 3'b000;
         adr_sel = 1'b0;
         s_sel   = 1'b0;
         pc_ld   = 1'b0;
         pc_inc  = 1'b1;
         pc_sel  = 1'b0;
         ir_ld   = 1'b1;
         mw_en   = 1'b0;
         rw_en   = 1'b0;
         alu_op  = 4'b0000;
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, ps_C}; // flags remain the same
         status  = 8'h80;
         nextstate = DECODE;
         
         end//FETCH
         
         DECODE: begin 
         // Default Control Word, NS <- case(IR[15:9] ) -- LED pattern = 1100_0000
         W_Adr   = 3'b000;
         R_Adr   = 3'b000;
         S_Adr   = 3'b000;
         adr_sel = 1'b0;
         s_sel   = 1'b0;
         pc_ld   = 1'b0;
         pc_inc  = 1'b0;
         pc_sel  = 1'b0;
         ir_ld   = 1'b0;
         mw_en   = 1'b0;
         rw_en   = 1'b0;
         alu_op  = 4'b0000;
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'hC0;
         //next state
          case( IR[15:9] )
            7'h70:   nextstate = ADD;
            7'h71:   nextstate = SUB;
            7'h72:   nextstate = CMP;
            7'h73:   nextstate = MOV;
            7'h74:   nextstate = SHL;
            7'h75:   nextstate = SHR;
            7'h76:   nextstate = INC;
            7'h77:   nextstate = DEC;
            7'h78:   nextstate = LD;
            7'h79:   nextstate = STO;
            7'h7A:   nextstate = LDI;
            7'h7B:   nextstate = HALT;
            7'h7C:   nextstate = JE;
            7'h7D:   nextstate = JNE;
            7'h7E:   nextstate = JC;
            7'h7F:   nextstate = JMP;
            default: nextstate = ILLEGAL_OP;
           endcase
         end//DECODE
         
         ADD:  begin
         // R[ir(8:6)] <- R[ir(5:3)] + R[ir(2:0)] -- LED pattern = {ps_N, ps_Z, ps_C, 5'b00000}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;         
      
         end//ADD
         
         SUB:  begin
         //R[ir(8:6)] <- R[ir(5:3)] - R[ir(2:0)] -- LED pattern = {ps_N, ps_z, ps_C, 5'b00001}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//SUB
         
         CMP:  begin
         // R[ir(5:3)] - R[ir(2:0)] -- LED pattern = {ps_N, ps_Z, ps_C, 5'b00010}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//CMP
         
         MOV:  begin
         //R[ir(8:6)] <- R[ir(2:0)] -- LED pattern = {ns_N, ns_Z, ns_C, 5'b00011}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;       
      
         end//MOV
         
         SHL:  begin
         // R[ir(8:6)] <- R[ir(2:0)] << 1 -- LED pattern = {ps_N, ps_Z, ps_C, 5'b00100}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//SHL
         
         SHR:  begin
         // R[ir(8:6)] <- R[ir(2:0] >> 1 -- LED pattern = {ps_N, ps_Z, ps_C, 5'b00101}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//SHR
         
         INC:  begin
         // R[ir(8:6)] <- R[ir(2:0)] + 1 -- LED pattern = {ps_N, ps_Z, ps_C, 5'b00110}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;         
      
         end//INC
         
         DEC:  begin
         // R[ir(8:6)] <- R[ir(2:0)] - 1 -- LED = {ps_N, ps_Z, ps_C, 5'b00111}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//DEC
         
         LD:   begin
         // R[ir(8:6)] <- M[ R[ir(2:0)] ] -- LED pattern = {ps_N, ps_Z, ps_C, 5'01000}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//LD
         
         STO:  begin
         // M[ R[ir(8:6)] ] <- R[ir(2:0)] -- LED pattern = {ps_N, ps_Z, ps_C, 5'b01001}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//STO
         
         LDI:  begin
         // R[ir(8:6)] <- M[PC], PC <- PC + 1 -- LED pattern = {ps_N, ps_Z, ps_C, 5'b01010}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//LDI
         
         JE:   begin
         // if (ps_Z=1) PC <- PC+se_IR[7:0] else PC <- PC -- LED pattern = {ps_N, ps_Z, ps_C, 5'b01100}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//JE
         
         JNE:  begin
         // if (ps_Z=0) PC <- PC+se_IR[7:0] else PC <- PC -- LED pattern = {ps_N, ps_Z, ps_C, 5'b01101}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//JNE
         
         JC:   begin
         // if (ps_C=1) PC <- PC+se_IR[7:0] else PC <- PC -- LED pattern = {ps_N, ps_Z, ps_C, 5'b01110}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//JC
         
         JMP:  begin
         // PC <- R[ir(2:0)] -- LED pattern = {ps_N, ps_Z, ps_C, 5'b01111}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = FETCH;        
      
         end//JMP
         
         HALT: begin
         // Default Control Word Values -- LED pattern = {ps_N, ps_Z, ps_C, 5'b01011}
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = HALT;         
      
         end//HALT
   
         ILLEGAL_OP: begin
         //Default Control Word Values -- LED pattern = 1111_0000
         W_Adr   = 3'b
         R_Adr   = 3'b
         S_Adr   = 3'b
         adr_sel = 1'b
         s_sel   = 1'b
         pc_ld   = 1'b
         pc_inc  = 1'b
         pc_sel  = 1'b
         ir_ld   = 1'b
         mw_en   = 1'b
         rw_en   = 1'b
         alu_op  = 4'b
         {ns_N, ns_Z, ns_C} = {ps_N, ps_Z, pc_C};
         status  = 8'h
         nextstate = ILLEGAL_OP;        
      
         end//ILLEGAL_OP
   endcase
   
   
   
   
   
   
endmodule
