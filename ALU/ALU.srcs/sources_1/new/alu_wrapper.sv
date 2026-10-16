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
    input logic [2:0] op_sel_i,
    input logic btnu_i, // calculate
    output logic [3:0] accu_o,
    output logic [1:0] flags_o
    );
    
    logic [3:0] accu;
    logic [3:0] alu_result;
    logic previous_btn = 0;
    logic pulse = 0;
    logic btn_db = 0;
    logic btn_click = 0;
    

    alu ALU(
        .op (op_sel_i), 
        .a (accu), 
        .b (data_i), 
        .out (alu_result), 
        .c_out (flags_o[0])
    );

//comment this for test
    delay_counter DC(
        .clk (clk),
        .pulse (pulse)
    );

    btn_debouncer BD(
        .clk (clk),
        .rst (rst),
        .pulse (pulse),
        .btn_state (btnu_i),
        .btn_debounced (btn_db)
    ); 
//
    
    btn_edge_detect BED(
        .clk (clk),
        .btn_state (btn_db), //use btn_db for synthesis, btnu_i for test
        .detection (btn_click)
    );

    // Behavioral: the only way to describe a clocked register-dataflow cannot hold state
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            accu <= 4'b0000;
            flags_o <= 2'b00;
        end
        else if (btn_click) //perform calculation, synced with clock
            accu <= alu_result;
        accu_o <= accu;
    end

endmodule
