`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2026 18:50:29
// Design Name: 
// Module Name: alu_wrapper_tb
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


module alu_wrapper_tb(

    );
    logic clk_tb = 0;
    logic rst_tb = 0;
    logic [3:0] data_i_tb;
    logic [3:0] op_sel_i_tb;
    logic btnu_i_tb = 0;
    logic [3:0] accu_o_tb;
    logic [1:0] flags_o_tb;
    
    alu_wrapper ALU_WR(
        .clk (clk_tb),
        .rst (rst_tb),
        .data_i (data_i_tb),
        .op_sel_i (op_sel_i_tb),
        .btnu_i (btnu_i_tb),
        .accu_o (accu_o_tb),
        .flags_o (flags_o_tb)
    );
    
    initial begin
        rst_tb = 1;
        op_sel_i_tb = 3'b000;
        data_i_tb = 4'b0001;
        #5;
        rst_tb = 0;
        // change operation
        for (int opi = 0; opi <= 7; opi++) begin
            op_sel_i_tb = opi;
            if ((opi >= 2) && (opi < 6)) begin
                // change data
                for (int ai = 1; ai <= 5; ai=ai+2) begin
                    data_i_tb = ai;
                    // simulate clock and button for logic operations
                    for (int i = 0; i < 100; i++) begin
                        clk_tb = clk_tb ^ 1;
                        if (!(i % 10))
                            btnu_i_tb = btnu_i_tb ^ 1;
                        #10;
                    end
                end
            end
            else if (opi <= 2) begin
            // simulate clock and button for and and sub
               for (int i = 0; i < 100; i++) begin
                   clk_tb = clk_tb ^ 1;
                   if (!(i % 15))
                       btnu_i_tb = btnu_i_tb ^ 1;
                   #10;
               end
            end
            else begin
               // simulate clock and button for shitfs
                for (int i = 0; i < 100; i++) begin
                   clk_tb = clk_tb ^ 1;
                   if (!(i % 30))
                       btnu_i_tb = btnu_i_tb ^ 1;
                   #10;
                end
            end
        end
        rst_tb = 1;
        #10;
        rst_tb = 0;
    end
    
    
endmodule