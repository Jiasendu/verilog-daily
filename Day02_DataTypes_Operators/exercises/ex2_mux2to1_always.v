// 练习 2：2 选 1 多路选择器（用 always 实现）
// 注意：被 always 赋值的输出必须声明为 reg
module mux2to1_always (
    input  wire       sel,
    input  wire [3:0] a,
    input  wire [3:0] b,
    output reg  [3:0] y
);
    always @(*) begin
        if (sel)        // 1 位信号可直接判，等价于 if(sel == 1)
            y = b;
        else
            y = a;
    end
endmodule
