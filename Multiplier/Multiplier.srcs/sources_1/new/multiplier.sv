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

logic sum[n*2-1:0];
logic [n-1:0] array_signal [0:n-1];
    
//if (B[0]) array_signal[0] = A;

assign array_signal[0] = A & {n{B[0]}};

generate    
    for (genvar i = 0; i < n-1; i++) begin : gen_multiplier
        ripple_carry_adder ADD(
            .A (array_signal[i]),
            .B (sum[i+n:i+1]),
            .Cin (1'b0),
            .S (sum[i+n:i+1]),
            .Cout (sum[i+n+1])
            );
    end
endgenerate 

//assign S = sum;
    
endmodule
