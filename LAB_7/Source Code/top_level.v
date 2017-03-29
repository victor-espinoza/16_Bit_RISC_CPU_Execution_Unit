`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Victor Espinoza
// Partner:        Edward Mares
// Email:          victor.alfonso94@gmail.com
//
// Create Date:    19:16:32 11/16/2013 
// Module Name:    top_level 
// File Name:      top_level.v
//
// Description:    This module pulls together our CPU_EU module and connects it to
//                 our ram module so that we can combine them together and 
//                 successfully implement our CPU Execution Unit.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_level(clk, reset, step_clk, mem_w_en, s_sel, a_d, a3, a2, a1, 
                 a0, a, b, c, d, e, f, g, N, Z, C, adr_sel, PC_ld, IR_ld,
                 PC_inc, reg_wen);
                
    //Inputs 
   input clk, reset, s_sel, a_d, adr_sel, PC_ld, IR_ld, PC_inc, reg_wen, step_clk, mem_w_en;
   
   //Outputs
   output wire a, b, c, d, e, f, g, a3, a2, a1, a0, N, Z, C;
   
   //Local Declarations
   wire idp_clk, mem_we, deb_a_d, clk_IBUFG, clk_out;
   wire [15:0] D_out, Address_muxed, address, D_in;
   
   BUFG clock_buff(.I(clk), .O(clk_IBUFG));
   
   //module   clk_500HZ(clk_in, reset, clk_out);
   clk_500HZ board_clk (clk_IBUFG, reset, clk_out);
   
   //module   debounce(clk, reset, Din, Dout);
   debounce  d1 (clk_out, reset, step_clk, idp_clk), 
             d2 (clk_out, reset, mem_w_en,  mem_we);
    
   //module CPU_EU(clk, reset, W_en, S_Sel, N, Z, C, Adr_Sel, PC_ld,
   //              IR_ld, PC_inc, Address_data, D_in, D_out);
   CPU_EU    EU (idp_clk, reset, reg_wen, s_sel, N, Z, C, adr_sel, PC_ld,
                IR_ld, PC_inc, address, D_in, D_out);      
   
   
   
   //module  ram1(clk, we, addr, din, dout); 
   ram1      r1 (clk_IBUFG, mem_we, address[7:0], D_out, D_in);
   
  
   /*(idp_clk, reset, reg_wen, IR_out[8:6], IR_out[2:0], 
      s_sel, IR_out[5:3], IR_out[15:12], N, Z, C, reg_out, 
      alu_out, adr_sel, PC_ld, IR_ld, PC_inc, IR_inc, 
      PC_out, IR_out, address, ram_dout);*/
                               
    
   //determine which d_out to display (ram or cpu_eu).
	assign Address_muxed = (a_d == 1'b1) ? address : D_out;
   
   //         display_controller(clk, reset, ad_high, ad_low, d_high, d_low,  
   //                            a3, a2, a1, a0, a, b, c, d, e, f, g);    
   
   display_controller display (clk_IBUFG, reset, Address_muxed[15:12],  
                               Address_muxed[11:8], Address_muxed[7:4], 
                               Address_muxed[3:0], a3, a2, a1, a0, a, b, c, d, 
                               e, f, g);
                               
endmodule
