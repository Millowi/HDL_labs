`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2026 18:11:47
// Design Name: 
// Module Name: btn_edge_detect
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


module btn_edge_detect(
    input clk,
    input btn_state,
    output detection
    );
    logic btn_current = 0;
    logic btn_prev = 0;
    
    
    always_ff @(posedge clk) begin : proc_btn_current
        btn_current <= btn_state;
        btn_prev <= btn_current;
    end
    assign detection = btn_current & ~btn_prev;

endmodule
