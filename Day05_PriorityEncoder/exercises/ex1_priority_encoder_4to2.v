// Day 05 练习 1：4-to-2 优先级编码器（if-else 链）
// in 中为 1 的最高位决定输出编码；全 0 时 valid=0
module priority_encoder_4to2 (
    input      [3:0] in,
    output reg [1:0] out,
    output reg       valid
);
    always @(*) begin
        valid = 1'b1;
        if      (in[3]) out = 2'd3;
        else if (in[2]) out = 2'd2;
        else if (in[1]) out = 2'd1;
        else if (in[0]) out = 2'd0;
        else begin
            out   = 2'd0;
            valid = 1'b0;
        end
    end
endmodule