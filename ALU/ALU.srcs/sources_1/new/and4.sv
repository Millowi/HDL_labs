`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 19:46:57
// Design Name: 
// Module Name: and4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module and4(
    input [3:0] a,
    input [3:0] b,
    output [3:0] out
    );
    assign out = a & b;
    
endmodule
