`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 19:53:03
// Design Name: 
// Module Name: alu
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


module alu(
    input [2:0] op,
    input [3:0] a,
    input [3:0] b,
    output [3:0] out
    );
    logic [3:0] add_r, sub_r, and_r, or_r, xor_r, inv_r, shl_r, shr_r;
    
    adder ADD4(
        .a (a_tb),
        .b (b_tb),
        .c_in (0),
        .c_out (0),
        .s (add_r)
    );

    substractor SUB4(
        .a (a_tb),
        .b (b_tb),
        .c_in (1),
        .c_out (0),
        .s (sub_r)
    );

    and4 AND4(
        .a (a),
        .b (b),
        .out (and_r)
    );
    
    or4 OR4(
        .a (a),
        .b (b),
        .out (or_r)
    );
    
    xor4 XOR4(
        .a (a),
        .b (b),
        .out (xor_r)
    );
    
    inv4 INV4(
        .in (a),
        .out (inv_r)
    );

    shl4 SHL4(
        .in (a),
        .out (shl_r)
    );

    shr4 SHR4(
        .in (a),
        .out (shr_r)
    );

    assign out = (op == 3'b000) ? add_r :
        (op == 3'b001) ? sub_r :
        (op == 3'b010) ? and_r :
        (op == 3'b011) ? or_r :
        (op == 3'b100) ? xor_r :
        (op == 3'b101) ? inv_r :
        (op == 3'b110) ? shl_r : shr_r;
    
endmodule
