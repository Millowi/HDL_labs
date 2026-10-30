`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:57:26
// Design Name: 
// Module Name: ripple_carry_adder_tb
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

`define WIDTH 4

module ripple_carry_adder_tb(
    );
    logic [`WIDTH:0] A_tb, B_tb;
    logic [`WIDTH:0] sum_tb, sum_calc;
    
    ripple_carry_adder #(`WIDTH) u_add4 (
    .A (A_tb), 
    .B (B_tb),
    .Cin (1'b0),
    .S (sum_tb[`WIDTH-1:0]),
    .Cout (sum_tb[`WIDTH])
    );
    
    initial begin
        for (int ai = 0; ai < 16; ai++) begin
            A_tb = ai;
            for (int bi = 0; bi < 16; bi++) begin
                B_tb = bi;
                sum_calc = ai + bi;
                #10;
                assert (sum_tb == sum_calc) $display("");
                    else $error("sum_tb = %b (%d), must be %b (%d)", sum_tb, sum_tb, sum_calc, sum_calc);
            end
        end
    end

endmodule
