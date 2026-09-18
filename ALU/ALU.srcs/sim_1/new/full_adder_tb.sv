`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 17:05:23
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb(

    );

    logic a_tb, b_tb, c_in_tb;
    logic [1:0] sum_tb;
    
    full_adder FA(
        .a (a_tb),
        .b (b_tb),
        .c_in (c_in_tb),
        .c_out (sum_tb[1]),
        .sum (sum_tb[0])
    );
    
    initial begin
        a_tb = 0; b_tb = 0; c_in_tb = 0; #5
        a_tb = 0; b_tb = 1; c_in_tb = 0; #5
        a_tb = 1; b_tb = 0; c_in_tb = 0; #5
        a_tb = 1; b_tb = 1; c_in_tb = 0; #5
        
        a_tb = 0; b_tb = 0; c_in_tb = 1; #5
        a_tb = 0; b_tb = 1; c_in_tb = 1; #5
        a_tb = 1; b_tb = 0; c_in_tb = 1; #5
        a_tb = 1; b_tb = 1; c_in_tb = 1; #5
        $stop;
    end

endmodule
