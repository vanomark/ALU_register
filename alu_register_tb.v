`timescale 1ns/1ps

module alu_register_tb();
    
    localparam WIDTH = 8;

    reg              clk_i;
    reg              arstn_i;
    reg [WIDTH-1:0]  first_i;
    reg [WIDTH-1:0]  second_i;
    reg [2:0]        opcode_i;
    wire [WIDTH-1:0] result_o;

    alu_register #(
        .WIDTH(WIDTH)
    )  alu_register_tb_inst ( 
        .clk_i    (clk_i),
        .arstn_i  (arstn_i),
        .first_i  (first_i),
        .second_i (second_i),
        .opcode_i (opcode_i),
        .result_o (result_o)
    );  
    
    
     initial begin
        $dumpvars;
        clk_i = 0;
        arstn_i = 1;
        // NOR operation 
        // result = ~(first | second)
        first_i = 8'hAA;  // 10101010
        second_i = 8'b111; // 00000111
        opcode_i = 3'b000;
        #10;
        clk_i = 1;
        #10
        arstn_i = 0;
        #10
        opcode_i = 3'b000;
        
        
        $finish;
    end
    

endmodule