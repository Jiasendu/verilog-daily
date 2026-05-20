# Day 02 - 数据类型与运算符

## 📖 知识点

### 1. wire vs reg

| 类型 | 用法 | 适用场景 |
|---|---|---|
| `wire` | 用 `assign` 驱动 | 连续赋值、组合逻辑 |
| `reg` | 在 `always` 块里赋值 | 过程性赋值（组合/时序都可能）|

⚠️ **`reg` 不等于硬件寄存器**！它只是语法上要求"被 always 块赋值的变量必须叫 reg"，最终综合成什么取决于代码写法。

### 2. always @(*) 写组合逻辑

```verilog
always @(*) begin
    if (sel) y = a;
    else     y = b;
end
```

- `@(*)` 表示"任意输入变化时重新计算"——组合逻辑的标志
- `begin ... end` 相当于 C 的 `{ ... }`
- if-else 综合后是一个 MUX，不是顺序分支
- **每个变量在所有分支上都要有值**，否则可能综合出 latch

### 3. case 语句

```verilog
case (sel)
    2'b00:   y = a;
    2'b01:   y = b;
    default: y = 4'b0;    // ⚠️ 永远写 default
endcase
```

- 类似 C 的 switch，但**不需要 break**
- **必须写 default**，否则可能综合出 latch（养成习惯）

### 4. signed 关键字与补码

```verilog
input wire signed [7:0] data;
```

- `signed` 让 Verilog 把这个信号当**补码**理解
- 最高位（这里是 `data[7]`）是符号位
- 可以直接用 `data < 0`、`-data` 等运算

## 📝 练习题

见 `exercises/` 目录。涵盖 MUX 的两种写法、case 语句、有符号数运算。

## 💭 心得

（学完后填写）
