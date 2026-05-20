// 练习 1：2 选 1 多路选择器（用 assign 实现）
// sel = 0 时 y = a，sel = 1 时 y = b
module mux2to1_assign (
    input  wire       sel,
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y
);
    assign y = sel ? b : a;
endmodule
