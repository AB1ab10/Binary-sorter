`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2022 12:43:46 PM
// Design Name: 
// Module Name: test_sorter
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


module test_sorter();

reg[7:0] in_t;
reg ld_t , ck_t , reset_t;
wire VO_t , out_t;

sorter dut(
    .in(in_t),
    .ld(ld_t),
    .ck(ck_t),
    .reset(reset_t),
    .VO(VO_t),
    .out(out_t)
);

initial begin
    ck_t  = 0;
    forever # 5 ck_t = ~ck_t;
    end


initial begin
    reset_t = 1 ; ld_t = 0 ; in_t = 8'b01010101;
    #10 reset_t = 0; ld_t = 1;
    #100 reset_t = 1 ; ld_t = 0;
    #5 reset_t = 0; ld_t = 1;
    #100 $stop;
    end

endmodule
