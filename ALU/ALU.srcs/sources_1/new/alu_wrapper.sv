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
    input logic CLK100MHZ,
    input logic reset,
    input logic [3:0] data_i,
    input logic [2:0] op_sel_i,
    input logic btnu_i, // calculate
    output logic [3:0] accu_o,
    output logic [1:0] flags_o
    );
    
    logic [3:0] accu;
    logic [3:0] alu_result;
    logic pulse;
    logic btn_db;
    logic btn_click;
    logic carry;
    

    alu ALU(
        .op (op_sel_i), 
        .a (accu), 
        .b (data_i), 
        .out (alu_result), 
        .c_out (carry)
    );

//comment this for test
   delay_counter DC(
        .clk (CLK100MHZ),
        .pulse (pulse)
    );

    btn_debouncer BD(
        .clk (CLK100MHZ),
        .rst (reset),
        .pulse (pulse),
        .btn_state (btnu_i),
        .btn_debounced (btn_db)
    );
//
    
    btn_edge_detect BED(
        .clk (CLK100MHZ),
        .btn_state (btn_db), //use btn_db for synthesis, btnu_i for test
        .detection (btn_click)
    );

    // Behavioral: the only way to describe a clocked register-dataflow cannot hold state
    always @(posedge CLK100MHZ or posedge reset) begin : test
        if (reset) begin
            accu <= 4'b0000;
            flags_o <= 2'b00;
        end
        else if (btn_click == 1) begin //perform calculation, synced with clock
            accu <= alu_result;
            flags_o[0] <= carry;
            flags_o[1] <= !(|alu_result);
            
        end
    end
/*always_comb begin
    flags_o[0] = carry;
    flags_o[1] = !(|accu);
end*/
    assign accu_o = accu;
    
endmodule
