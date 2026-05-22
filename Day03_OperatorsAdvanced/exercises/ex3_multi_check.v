// Day 03 练习 3：三种"与"运算符综合判断
module multi_check (
    input  [3:0] a,
    input  [3:0] b,
    output       both_nonzero,
    output       any_bit_match,
    output       a_all_ones
);
    assign both_nonzero  = a && b;    // 逻辑与：a≠0 且 b≠0
    assign any_bit_match = |(a & b);  // 先按位 AND，再缩位 OR
    assign a_all_ones    = &a;        // 缩位 AND：a 的所有位都是 1
endmodule
