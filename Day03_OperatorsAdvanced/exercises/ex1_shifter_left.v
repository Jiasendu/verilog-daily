// Day 03 练习 1：可变位数左移器
// 我的答案用了 <<<（算术左移），结果正确但约定应用 << （逻辑左移）
// 因为 data 是无符号 [7:0]，两者行为相同，但规范写法是 <<
module shifter_left (
    input  [7:0] data,
    input  [2:0] shift,
    output [7:0] result
);
    assign result = data << shift;   // 规范写法
endmodule
