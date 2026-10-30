`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 19:46:09
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb(
    );
    logic sum_tb[7:0];
    
    multiplier#(4) MUL (
    .A (4'b1101), 
    .B (4'b1010),
    .Cin (1'b0),
    .S (sum_tb)
    );
endmodule
