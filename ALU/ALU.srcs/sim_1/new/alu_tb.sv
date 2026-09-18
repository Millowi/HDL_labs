`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2026 20:12:41
// Design Name: 
// Module Name: alu_tb
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


module alu_tb(

    );
    logic [3:0] a_tb, b_tb, out_tb;
    logic [2:0] op_tb;
    
    alu ALU(
        .a (a_tb),
        .b (b_tb),
        .op (op_tb),
        .out (out_tb)
    );
    
    initial begin
    a_tb[3] = 0; a_tb[2] = 1; a_tb[1] = 1; a_tb[0] = 0;
    b_tb[3] = 0; b_tb[2] = 0; b_tb[1] = 1; b_tb[0] = 1;
        for (int opi = 0; opi <= 7; opi++) begin
            op_tb = opi;
            #10;
        end
        $stop;
    end

endmodule
