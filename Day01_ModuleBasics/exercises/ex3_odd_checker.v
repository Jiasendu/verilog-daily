// 练习 3：奇偶判断
// 二进制下最低位 = 1 即为奇数，直接把 data[0] 连到输出即可
module odd_checker (
    input  wire [7:0] data,
    output wire       is_odd
);
    assign is_odd = data[0];
endmodule
