// Day 04 练习 3：两级移位寄存器
// 结果：❌ → 修正版
//
// 原始错误：
//   1. "reg stage1 <= din;" 把声明和赋值混写在 always 块内部，语法错误
//   2. dout 是 output wire，不能在 always 块内用 <= 赋值
//
// 修正要点：
//   - reg 声明放在 module 级别
//   - wire 类型的 dout 用 assign 驱动
//   - 用非阻塞赋值 <= 保证 stage1→stage2 逐拍移位（不是同一拍直通）

module shift_reg2 (
    input  wire clk,
    input  wire rst_n,
    input  wire din,
    output wire dout
);
    reg stage1, stage2;   // ✅ 在 module 层声明

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stage1 <= 1'b0;
            stage2 <= 1'b0;
        end else begin
            stage1 <= din;     // 非阻塞：右侧同时采样
            stage2 <= stage1;  // 拿到的是旧 stage1，形成移位链
        end
    end

    assign dout = stage2;  // ✅ wire 用 assign 驱动
endmodule
