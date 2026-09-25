`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 18:27:38
// Design Name: 
// Module Name: substractor_tb
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


module substractor_tb(

    );

    logic c_in_tb;
    logic [3:0] a_tb, b_tb;
    logic [3:0] sum_tb;
    logic c_out_tb;
    int sum_calc;
    logic [4:0] sum_calc_b;
    
    substractor A(
        .a (a_tb),
        .b (b_tb),
        .c_in (1),
        .c_out (c_out_tb),
        .s (sum_tb)
    );
    
    initial begin
        for (int ai = 0; ai <= 16; ai++) begin
            a_tb = ai;
            for (int bi = 0; bi < 16; bi++) begin
                b_tb = bi;
                sum_calc = ai - bi;
                sum_calc_b = sum_calc;
                #10;
                assert (sum_tb == sum_calc) $display("");
                    else $error("sum_tb = %b (%d), must be %b (%d)", sum_tb, sum_tb, sum_calc_b, sum_calc);
            end
        end
        $stop;
    end

endmodule
