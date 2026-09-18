`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 17:27:42
// Design Name: 
// Module Name: adder_tb
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


module adder_tb(

    );

    logic c_in_tb;
    logic [3:0] a_tb, b_tb;
    logic [4:0] sum_tb;
    logic [4:0] sum_calc;
    
    adder A(
        .a (a_tb),
        .b (b_tb),
        .c_in (c_in_tb),
        .c_out (sum_tb[4]),
        .s (sum_tb[3:0])
    );
    
    initial begin
        c_in_tb = 0;
        for (int ai = 0; ai <= 16; ai++) begin
            a_tb = ai;
            for (int bi = 0; bi < 16; bi++) begin
                b_tb = bi;
                sum_calc = ai + bi;
                #10;
                assert (sum_tb == sum_calc) $display("");
                    else $error("sum_tb = %b (%d), must be %b (%d)", sum_tb, sum_tb, sum_calc, sum_calc);
            end
        end
        
        c_in_tb = 1;
        for (int ai = 0; ai <= 16; ai++) begin
            a_tb = ai;
            for (int bi = 0; bi < 16; bi++) begin
                b_tb = bi;
                sum_calc = ai + bi;
                #10;
                assert (sum_tb == sum_calc) $display("");
                    else $error("sum_tb = %b (%d), must be %b (%d)", sum_tb, sum_tb, sum_calc, sum_calc);
            end
        end
        $stop;
    end

endmodule
