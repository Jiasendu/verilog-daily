// Day 04 练习 4：上升沿检测器（单周期脉冲）
// 结果：❌ → 修正版
//
// 原始错误：
//   1. "reg sig_d <= sig;" 和 "reg pulse_temp <= 0;" 在 always 内声明变量，语法错误
//   2. pulse 逻辑混乱，不需要用寄存器生成脉冲
//
// 修正思路：
//   - sig_d 寄存器记录 sig 上一拍的值
//   - 当前 sig=1、上一拍 sig_d=0 → 发生上升沿 → 输出单周期高脉冲
//   - 用 assign 一行组合逻辑即可，无需额外寄存器

module edge_detect (
    input  wire clk,
    input  wire rst_n,
    input  wire sig,
    output wire pulse
);
    reg sig_d;   // ✅ 在 module 层声明

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            sig_d <= 1'b0;
        else
            sig_d <= sig;   // 每拍存当前 sig，下一拍用
    end

    // 当前是 1，上一拍是 0 → 上升沿 → 单周期脉冲
    assign pulse = sig & ~sig_d;
endmodule
