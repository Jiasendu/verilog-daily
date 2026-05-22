// Day 05 练习 3：独热码（one-hot）检测器
// 独热 = 恰好一个 1。技巧：非零(|data) 且 清除最低位 1 后为 0
// 注意 |data（缩位或，判非零）与 ~data（按位取反）的区别
module onehot_check (
    input  [7:0] data,
    output       is_onehot
);
    assign is_onehot = (|data) & ((data & (data - 1)) == 8'b0);
endmodule