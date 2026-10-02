`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2026 18:16:43
// Design Name: 
// Module Name: btn_debouncer
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


module btn_debouncer(
    input clk,
    input rst,
    input pulse,
    input btn_state,
    output btn_debounced
    );
    
    logic [3:0] debouncer_reg;
    logic out = 0;
    
    always @(posedge clk or posedge rst) begin : proc_debounce_reg
        if(rst) begin
            debouncer_reg = '0;
            out = 0;
            
        end else if (pulse)
            debouncer_reg = {debouncer_reg[2:0], btn_state} ;
       
        if (&debouncer_reg)
            out = 1;
    end
    assign btn_debounced = out;
endmodule
