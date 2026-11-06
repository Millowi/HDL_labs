`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 18:51:11
// Design Name: 
// Module Name: multiplier
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


module multiplier#(parameter int n = 4)
    (input logic [n-1:0] A, B,
    input logic Cin,
    output logic [n*2-1:0] S
    );

logic [n-1:0] A_array [0:n-2];
logic [n:0] Sum_array [0:n-1];

assign Sum_array[0][n-1:0] = (A & {n{B[0]}});
assign Sum_array[0][n] = 0;

generate    
    for (genvar i = 0; i < n-1; i++) begin : gen_multiplier

        assign A_array[i] = A & {n{B[i+1]}};
    
        ripple_carry_adder ADD(
            .A (A_array[i]),
            .B (Sum_array[i][n:1]),
            .Cin (1'b0),
            .S (Sum_array[i+1][n-1:0]),
            .Cout (Sum_array[i+1][n])
            );
            
        assign S[i] = Sum_array[i][0];
    end
endgenerate 

assign S[n*2-1:n*2-1-n] = Sum_array[n-1][n:0];
    
endmodule
