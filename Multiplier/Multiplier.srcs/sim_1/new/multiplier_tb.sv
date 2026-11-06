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
    logic [7:0] sum_tb;
    logic [3:0] a_tb, b_tb;
    logic [13:0] calc_tb;
    
    initial begin
        a_tb = 4'b1101; b_tb = 4'b1010; calc_tb = a_tb * b_tb; #5 
        a_tb = 4'b1111; b_tb = 4'b0000; calc_tb = a_tb * b_tb; #5
        a_tb = 4'b1111; b_tb = 4'b1111; calc_tb = a_tb * b_tb; #5
        a_tb = 4'b0001; b_tb = 4'b0001; calc_tb = a_tb * b_tb; #5
        a_tb = 4'b0000; b_tb = 4'b0001; calc_tb = a_tb * b_tb; #5
        a_tb = 4'b0001; b_tb = 4'b0000; calc_tb = a_tb * b_tb; #5
        
        a_tb = 4'b0000; b_tb = 4'b0000; calc_tb = a_tb * b_tb; #5;
        a_tb = 4'b1111; b_tb = 4'b1111; calc_tb = a_tb * b_tb; #5;
        a_tb = 4'b1111; b_tb = 4'b0000; calc_tb = a_tb * b_tb; #5;
        a_tb = 4'b0000; b_tb = 4'b1111; calc_tb = a_tb * b_tb; #5;
        a_tb = 4'b1111; b_tb = 4'b0000; calc_tb = a_tb * b_tb; #5;
        a_tb = 4'b0000; b_tb = 4'b1111; calc_tb = a_tb * b_tb; #5;
        a_tb = 4'b0101; b_tb = 4'b1010; calc_tb = a_tb * b_tb; #5;
        a_tb = 4'b1010; b_tb = 4'b0101; calc_tb = a_tb * b_tb; #5;
        $stop;
    end
    
    multiplier#(4) MUL (
    .A (a_tb), 
    .B (b_tb),
    .Cin (1'b0),
    .S (sum_tb)
    );
endmodule
