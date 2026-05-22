// Day 04 练习 2：4-bit 使能寄存器
// 结果：✅（else q<=q 可省略，保留也没问题，更清晰）
module reg4 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       en,
    input  wire [3:0] d,
    output reg  [3:0] q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 4'b0000;
        else if (en)
            q <= d;
        // else q <= q;  // 可省略，时序逻辑默认保持
    end
endmodule
