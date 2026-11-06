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


module ripple_carry_adder // have to use generate
    #(parameter int n = 4)
    (input logic [n-1:0] A, B,
    input logic Cin,
    output logic [n-1:0] S,
    output logic Cout);
     
    logic carry[n:0];
    assign carry[0] = Cin;
    
    generate        
        for (genvar i = 0; i < n; i++) begin : gen_full_adders            
            full_adder FA (
            .a   (A[i]),
            .b   (B[i]),
            .c_in (carry[i]),
            .sum (S[i]),
            .c_out(carry[i+1]));        
        end
    endgenerate
    
    assign Cout = carry[n];
    
endmodule
