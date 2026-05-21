// Day 03 练习 4：32-bit 字节序反转
module byte_swap (
    input  [31:0] data,
    output [31:0] result
);
    assign result = {data[7:0], data[15:8], data[23:16], data[31:24]};
endmodule
