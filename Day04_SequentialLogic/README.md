# Day 04 - 时序逻辑初步：always @(posedge clk)

## 核心知识点

### 1. 组合逻辑 vs 时序逻辑

| | 组合逻辑 | 时序逻辑 |
|---|---|---|
| 触发方式 | 输入变化立刻输出 | 仅在时钟沿更新 |
| 硬件元件 | 门电路 | D 触发器（寄存器） |
| Verilog 描述 | `always @(*)` 或 `assign` | `always @(posedge clk)` |

D 触发器示意：

```
        ┌─────────┐
  d ───►│  D   Q  ├───► q
        │         │
 clk ──►│>        │
        └─────────┘
```

```verilog
always @(posedge clk) begin
    q <= d;    // 时钟上升沿时，把 d 采样到 q
end
```

---

### 2. 非阻塞赋值 `<=` vs 阻塞赋值 `=`（铁律）

| | 阻塞 `=` | 非阻塞 `<=` |
|---|---|---|
| 执行方式 | 顺序执行（像 C 赋值） | 所有右侧同时采样，再同时更新左侧 |
| 用在哪 | `always @(*)` 组合逻辑 | `always @(posedge clk)` 时序逻辑 |
| 硬件含义 | 连线 | 寄存器（触发器） |

**铁律：时序逻辑用 `<=`，组合逻辑用 `=`。混用会导致仿真与综合行为不一致。**

移位链示例（非阻塞赋值的正确硬件行为）：
```verilog
// ✅ 非阻塞：所有右侧同时采样 → 两个独立触发器，数据 d→a→b 逐拍流动
always @(posedge clk) begin
    a <= d;
    b <= a;  // 拿到的是旧 a，形成移位
end

// ❌ 阻塞：a 先更新，b 拿到新 a → b 直接等于 d（没有移位效果）
always @(posedge clk) begin
    a = d;
    b = a;
end
```

---

### 3. 同步复位 vs 异步复位

**同步复位**——复位也要等时钟沿：
```verilog
always @(posedge clk) begin
    if (!rst_n) q <= 1'b0;
    else        q <= d;
end
```

**异步复位**——复位信号来了立刻清零，不等时钟：
```verilog
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) q <= 1'b0;   // 异步复位优先
    else        q <= d;
end
```

注意：敏感列表要加 `negedge rst_n`；`if (!rst_n)` 必须是第一个条件——综合器识别异步复位触发器的固定模板。

---

### 4. `reg` / `wire` 声明规则（重要！）

> **`reg` / `wire` 的声明永远在 `module` 顶部，`always` 块里只写赋值逻辑。**

```verilog
module example (...);
    reg stage1;    // ✅ 在这里声明
    always @(posedge clk) begin
        stage1 <= din;   // ✅ 在这里赋值
        // reg stage1 <= din;  ❌ 不能在 always 块内声明变量
    end
endmodule
```

---

## 练习情况

| 题号 | 主题                  | 结果 | 说明 |
|------|-----------------------|------|------|
| 1    | 带异步复位的 D 触发器  | ✅   | 模板掌握扎实 |
| 2    | 4-bit 使能寄存器      | ✅   | 逻辑正确（`else q<=q` 可省略，保留更清晰） |
| 3    | 两级移位寄存器         | ❌   | `reg` 在 `always` 内声明；`wire` 不能在 `always` 内赋值 |
| 4    | 上升沿检测器          | ❌   | 同上；`pulse` 用 `assign` 一行即可，不需要寄存器 |

## 关键收获

1. 时序逻辑模板：`always @(posedge clk or negedge rst_n)` + 异步复位判断
2. 非阻塞赋值 `<=` 保证移位链行为正确
3. `reg` 只能在 `module` 层声明，不能在 `always` 块里声明
4. `wire` 类型端口在模块内部要用 `assign` 驱动，不能在 `always` 里赋值
