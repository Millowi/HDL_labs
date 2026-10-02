`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2026 18:32:12
// Design Name: 
// Module Name: delay_counter
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


module delay_counter(
    input clk,
    output pulse
    );
    
    localparam int MAX_COUNT = 1000000;
    localparam int CNT_WIDTH = $clog2(MAX_COUNT + 1);
    
    reg local_pulse;
    logic [CNT_WIDTH-1:0] count;
    
        always_ff @(posedge clk) begin : proc_pulse_1MHz
            if(count < MAX_COUNT-1) begin
                count = count + 1;
                local_pulse <= '0;
            end else begin
                count = 0;
                local_pulse <= '1;
            end
        end
    assign pulse = local_pulse;
endmodule
