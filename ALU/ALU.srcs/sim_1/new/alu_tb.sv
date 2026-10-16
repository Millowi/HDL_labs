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
    logic [3:0] a_tb, b_tb, out_tb, out_calc;
    logic [2:0] op_tb;
    
    alu ALU(
        .a (a_tb),
        .b (b_tb),
        .op (op_tb),
        .out (out_tb)
    );
    
    initial begin
        for (int opi = 2; opi <= 7; opi++) begin
            op_tb = opi;
            for (int ai = 0; ai <= 16; ai++) begin
                a_tb = ai;
                for (int bi = 0; bi < 16; bi++) begin
                    b_tb = bi;
                    assign out_calc = (opi == 3'b010) ? a_tb & b_tb:
                        (opi == 3'b011) ? a_tb | b_tb :
                        (opi == 3'b100) ? a_tb ^ b_tb :
                        (opi == 3'b101) ? ~a_tb :
                        (opi == 3'b110) ? a_tb<<1 : a_tb>>1;
                    #10;
                    assert (out_tb == out_calc) $display("");
                            else $error("out_tb = %b (%d), must be %b (%d), op = %b", out_tb, out_tb, out_calc, out_calc, opi);
                end
            end
        end
        $stop;
    end

endmodule


