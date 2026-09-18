`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 16:40:03
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb(

    );
    
    logic a_tb, b_tb;
    logic [1:0] sum_tb;
    
    half_adder HA(
        .sum (sum_tb[0]),
        .a (a_tb),
        .carry (sum_tb[1]),
        .b (b_tb)
    );
    
    initial begin
        a_tb = 0; b_tb = 0; #5
        a_tb = 0; b_tb = 1; #5
        a_tb = 1; b_tb = 0; #5
        a_tb = 1; b_tb = 1; #5
        $stop;
    end
    
endmodule
