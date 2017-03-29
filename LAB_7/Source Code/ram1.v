`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:31 11/20/2013 
// Design Name: 
// Module Name:    ram1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ram1(
    input clk,
    input we,
    input [7:0] addr,
    input [15:0] din,
    output [15:0] dout
    );
    
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
   ram_256x16 dut (
   .clka(clk),
   .wea(we), // Bus [0 : 0] 
   .addra(addr), // Bus [7 : 0] 
   .dina(din), // Bus [15 : 0] 
   .douta(dout)); // Bus [15 : 0] 

// INST_TAG_END ------ End INSTANTIATION Template ---------


endmodule
