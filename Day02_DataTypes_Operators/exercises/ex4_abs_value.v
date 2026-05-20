// 练习 4：有符号数求绝对值
// data 是 8 位补码，最高位 data[7] 是符号位
// 写法 1：data[7] 判符号位
// 写法 2（更地道）：data < 0
module abs_value (
    input  wire signed [7:0] data,
    output reg         [7:0] result
);
    always @(*) begin
        if (data < 0)
            result = -data;
        else
            result = data;
    end
endmodule
