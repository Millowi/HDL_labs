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
logic [n-1:0] A_array [0:n-1];
logic [n-1:0] sum_array [0:n-1];
    
//if (B[0]) array_signal[0] = A;



generate    
    for (genvar i = 0; i < n-1; i++) begin : gen_multiplier
        //logic [n-1:0] adder_out;
        //logic adder_cout;
        assign A_array[i] = A & {n{B[i]}};
    
        ripple_carry_adder ADD(
            .A (A_array[i+1]),
            .B (sum[i+n:i+1]),
            .Cin (1'b0),
            .S (sum[i+n:i+1]),
            .Cout (sum[i+n+1])
            );
            
        //assign sum[i+n:i+1] = adder_out;
        //assign sum[i+n+1] = adder_cout;
    end
    assign sum[0] = A_array[0][0];
endgenerate 

//assign S = sum;sum[i+n:i+1]
    
endmodule
