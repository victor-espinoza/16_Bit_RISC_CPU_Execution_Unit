`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Victor Espinoza
// Partner:        Edward Mares
// Email:          victor.alfonso94@gmail.com
//
// Create Date:    22:46:40 11/10/2013  
// Module Name:    CPU_EU 
// File Name:      CPU_EU.v
//
// Description:    This module brings togehter our integer datapath module and 
//                 connects it to two 16 bit registers in order to create our
//                 CPU_EU module.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 
module CPU_EU(clk, reset, W_en, S_Sel, N, Z, C, Adr_Sel, PC_ld, IR_ld,
                PC_inc, Address_data, D_in, D_out);
    
   //Inputs
   input wire             clk, reset, W_en, S_Sel, Adr_Sel, PC_ld, IR_ld, PC_inc;
   input wire      [15:0] D_in;
   
   //Outputs
   output wire        N, Z, C;
   output wire [15:0] Address_data, D_out;
   
   //Local Declarations
   wire [15:0] Reg_out, PC_out, IR_out;
   
   //   integer_datapath(clk, reset, W_en, W_Adr, S_Adr, DS, S_Sel, 
   //                    R_Adr, ALU_OP, N, Z, C, Reg_Out, Alu_Out);
   integer_datapath  intData (clk, reset, W_en, IR_out[8:6], IR_out[2:0], D_in,  
                              S_Sel, IR_out[5:3], IR_out[15:12], N, Z, C, 
                              Reg_out, D_out);
   
   assign Address_data = (Adr_Sel == 1'b1) ? Reg_out : PC_out;
   
   //module CPU_EU_Registers(clk, reset, in, ld, inc, out);
   CPU_EU_Registers        PC (clk, reset, D_out, PC_ld, PC_inc, PC_out);
   
   //                module IR(clk, reset, ir_ld, Din, Dout);
   IR_Register             IR (clk, reset,  D_in, IR_ld, IR_out);
endmodule
