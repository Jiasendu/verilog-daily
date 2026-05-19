# Day 01 - 模块基础与 assign 连续赋值

## 📖 知识点

### 1. Verilog vs C/C++ 的思维差异

| C/C++ | Verilog |
|---|---|
| 描述"做什么"（顺序指令） | 描述"是什么"（硬件电路） |
| `int a = b + c;` 是一次计算 | `assign a = b + c;` 是一根连着加法器的导线 |
| 函数调用 | 模块例化 |
| 变量 | 信号（wire / reg） |

⚠️ **核心思维**：每一行 Verilog 都对应真实的硬件，模块内的语句是**并行**的。

### 2. 模块结构

```verilog
module module_name (
    input  wire        clk,
    input  wire [7:0]  data_in,
    output wire        result
);
    // 内部信号与逻辑
endmodule
```

- 端口方向：`input` / `output` / `inout`
- 位宽 `[7:0]`：8 位总线，左 MSB，右 LSB
- 数字字面量：`8'd100`（8 位十进制 100）、`4'b1010`、`8'hFF`

### 3. assign 连续赋值

`assign` 描述一根永远连着的导线，右边变左边立刻变。

```verilog
assign y = a & b;   // 一个 AND 门
```

## 📝 练习题

见 `exercises/` 目录。

## 💭 心得

（学完后填写）
