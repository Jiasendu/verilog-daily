// 练习 3：4 选 1 多路选择器
// case 语句必须写 default，防止综合出 latch
module mux4to1 (
    input  wire [1:0] sel,
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [3:0] c,
    input  wire [3:0] d,
    output reg  [3:0] y
);
    always @(*) begin
        case (sel)
            2'b00:   y = a;
            2'b01:   y = b;
            2'b10:   y = c;
            2'b11:   y = d;
            default: y = 4'b0;    // 必须有 default
        endcase
    end
endmodule
