// Day 03 练习 1：可变位数左移器
// 我的答案（能跑但用了 <<<，约定应该用 <<）
module shifter_left (
    input  [7:0] data,
    input  [2:0] shift,
    output [7:0] result
);
    assign result = data << shift;   // 规范写法
endmodule
