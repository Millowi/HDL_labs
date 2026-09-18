`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 17:19:44
// Design Name: 
// Module Name: adder
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


module adder(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output c_out,
    output [3:0] s
    );
    
    logic [2:0] carry;
    
    full_adder FA_0(
        .a (a[0]),
        .b (b[0]),
        .c_in (c_in),
        .c_out (carry[0]),
        .sum (s[0])
    );

    full_adder FA_1(
        .a (a[1]),
        .b (b[1]),
        .c_in (carry[0]),
        .c_out (carry[1]),
        .sum (s[1])
    );

    full_adder FA_2(
        .a (a[2]),
        .b (b[2]),
        .c_in (carry[1]),
        .c_out (carry[2]),
        .sum (s[2])
    );

    full_adder FA_3(
        .a (a[3]),
        .b (b[3]),
        .c_in (carry[2]),
        .c_out (c_out),
        .sum (s[3])
    );
    
endmodule
