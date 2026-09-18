`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 16:52:01
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
    );
    
    logic sum_ha_1, carry_ha_1, carry_ha_2;
    
    half_adder HA_1 (
        .a (a),
        .b (b),
        .sum (sum_ha_1),
        .carry (carry_ha_1)
    );
    
    half_adder HA_2 (
        .a (sum_ha_1),
        .b (c_in),
        .sum (sum),
        .carry (carry_ha_2)
    );
    
    assign c_out = carry_ha_1 | carry_ha_2;
    
endmodule
