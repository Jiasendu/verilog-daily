// 练习 4：信号交换
// 两个 assign 是并行的两根独立导线，没有先后关系，不需要临时变量
module swap (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] x,
    output wire [3:0] y
);
    assign x = b;
    assign y = a;
endmodule
