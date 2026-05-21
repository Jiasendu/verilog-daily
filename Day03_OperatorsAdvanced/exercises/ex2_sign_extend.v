// Day 03 练习 2：8→16 符号扩展
// 错误：写成 {8'b00000000, data}（零扩展，负数会变正数）
// 正确：用 {N{x}} 复制符号位
module sign_extend (
    input  [7:0]  data,
    output [15:0] result
);
    assign result = { {8{data[7]}}, data };
endmodule
