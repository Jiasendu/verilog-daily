// 练习 1：2 输入与非门 (NAND)
module nand_gate (
    input  wire a,
    input  wire b,
    output wire y
);
    assign y = ~(a & b);
endmodule
