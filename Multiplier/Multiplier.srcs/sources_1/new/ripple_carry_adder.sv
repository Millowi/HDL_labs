`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:49:39
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder
    #(parameter int n = 4)
    (input logic [n-1:0] A, B,
    input logic Cin,
    output logic [n-1:0] S,
    output logic Cout);
    
    logic [n:0] sum;
    
    assign sum = A + B + Cin;
    assign S = sum[n-1:0];
    assign Cout = sum[n];
    
endmodule
