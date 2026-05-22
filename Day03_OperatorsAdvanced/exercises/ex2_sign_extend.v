// Day 03 练习 2：8→16 符号扩展
// ❌ 我的错误写法：assign result = {8'b00000000, data};
//    这是零扩展！负数（最高位为 1）会被错误地变成正数。
//
// ✅ 正确写法：用复制运算符把符号位（data[7]）复制 8 次
module sign_extend (
    input  [7:0]  data,
    output [15:0] result
);
    assign result = { {8{data[7]}}, data };
    // data[7]=1 → {8{1}} = 8'hFF → 高位全 1（负数正确扩展）
    // data[7]=0 → {8{0}} = 8'h00 → 高位全 0（正数正确扩展）
endmodule
