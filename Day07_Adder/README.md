# Day 07 - 组合逻辑：加法器（Adder）

## 核心知识点

- 半加器：sum = a^b，carry = a&b
- 全加器：sum = a^b^cin，cout = (a&b)|(a&cin)|(b&cin)
- 行波进位加法器：多个全加器串联，低位 cout 接高位 cin
- Verilog 直接支持 + 运算符，综合器自动生成硬件
- 有符号溢出检测：overflow = tmp[N] ^ tmp[N-1]（符号扩展位与符号位矛盾）
- always @(*) 里所有分支必须赋值，否则推断 latch

## 练习情况

| 题号 | 主题 | 结果 | 说明 |
|------|------|------|------|
| 1    | 全加器 | OK | cout 第一次漏掉两项，理解后正确 |
| 2    | 4位行波进位加法器 | OK | 模块实例化复用 |
| 3    | 有符号加法器+溢出检测 | OK | overflow = tmp[8]^tmp[7] |
| 4    | 4位 ALU | OK | wire->reg，加默认值防 latch |