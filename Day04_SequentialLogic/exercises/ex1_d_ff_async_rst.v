// Day 04 练习 1：带异步复位的 D 触发器
// 结果：✅
module d_ff_async_rst (
    input  wire clk,
    input  wire rst_n,
    input  wire d,
    output reg  q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
