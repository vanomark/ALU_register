module alu_register #(
    parameter WIDTH = 8
)( 
    input                 clk_i,
    input               arstn_i,
    input [WIDTH-1:0]   first_i,
    input [WIDTH-1:0]  second_i,
    input [2:0]        opcode_i,
    output [WIDTH-1:0] result_o
);
    reg [WIDTH-1:0] res_internal;

    always @(posedge clk_i or negedge arstn_i) begin
        if (!arstn_i) begin
            res_internal <= {WIDTH{1'b0}};
        end else begin
            case (opcode_i)
                3'b000: res_internal <= ~(first_i | second_i);
                3'b001: res_internal <= first_i & second_i;
                3'b010: res_internal <= $signed(first_i) + $signed(second_i);
                3'b011: res_internal <= first_i + second_i;
                3'b100: res_internal <= ~second_i;
                3'b101: res_internal <= ~(first_i ^ second_i);
                3'b110: res_internal <= {{WIDTH-1{1'b0}}, (second_i == first_i)};
                3'b111: res_internal <= first_i >> second_i;
            endcase       
        end
    end
    
    assign result_o = res_internal;

endmodule