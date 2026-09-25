`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2026 18:29:40
// Design Name: 
// Module Name: alu_wrapper
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

module alu_wrapper (
    input logic clk,
    input logic rst,
    input logic [3:0] data_i,
    input logic [3:0] op_sel_i,
    input logic btnu_i, // calculate
    output logic [3:0] accu_o,
    output logic [1:0] flags_o
    );
    
    logic alu_result;

    alu ALU(
        .op (op_sel_i), 
        .a (data_i), 
        .b (accu_o), 
        .out (alu_result), 
        .c_out (flags_o[0])
    );

    // Behavioral: the only way to describe a clocked register-dataflow cannot hold state
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            accu_o <= 4'b0000;
        else if (btnu_i) //perform calculation, synced with clock
            accu_o <= alu_result;
    end
    
    // ...
endmodule
