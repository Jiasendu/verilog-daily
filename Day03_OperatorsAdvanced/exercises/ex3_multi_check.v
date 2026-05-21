// Day 03 练习 3：三种"与"运算符综合
module multi_check (
    input  [3:0] a,
    input  [3:0] b,
    output       both_nonzero,
    output       any_bit_match,
    output       a_all_ones
);
    assign both_nonzero  = a && b;
    assign any_bit_match = |(a & b);
    assign a_all_ones    = &a;
endmodule
