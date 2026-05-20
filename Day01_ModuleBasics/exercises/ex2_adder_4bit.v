// 练习 2：4 位加法器
// Verilog 加法会自动进行位宽扩展，sum (5位) = a (4位补0) + b (4位补0)
// 最高位 sum[4] 就是进位
module adder_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [4:0] sum
);
    assign sum = a + b;
endmodule
