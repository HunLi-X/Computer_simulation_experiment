# 计算机仿真实验

本仓库是计算机仿真课程实验代码与结果汇总，主要使用 MATLAB 完成基础建模、数值计算、图形绘制与控制系统分析。

![MATLAB](https://img.shields.io/badge/MATLAB-R2023a+-orange)
![实验数](https://img.shields.io/badge/实验-7-blue)
![状态](https://img.shields.io/badge/状态-持续更新-green)

## 项目目标

- 熟悉 MATLAB 基础语法、矩阵运算与脚本编写
- 掌握符号计算、数值计算和常见误差分析
- 学会二维/三维图形可视化与结果展示
- 了解连续系统与离散系统的建模与分析方法
- 掌握 Simulink 的编程式建模与仿真技术

## 目录结构

```text
实验/
├─ README.md
├─ 实验一/
│  ├─ README.md
│  ├─ main01.m ~ main05.m
│  ├─ mat_add.m
│  └─ res/
├─ 实验二/
│  ├─ README.md
│  ├─ main01.m ~ main04.m
│  └─ res/
├─ 实验三/
│  ├─ README.md
│  ├─ main01.m ~ main04.m
│  └─ res/
└─ 实验四/
   ├─ README.md
   ├─ main01.m ~ main04.m
   └─ res/
├─ 实验五/
│  ├─ README.md
│  ├─ main01.m ~ main03.m
│  └─ res/
└─ 实验六/
   ├─ README.md
   ├─ main01.m ~ main03.m
   └─ res/
└─ 实验八/
   ├─ README.md
   ├─ simlink.m
   ├─ FourOrderODE_Simulation.slx
   └─ res/
```

## 实验内容总览

### 实验一：MATLAB 基础操作

- 矩阵与复数运算
- 符号替换与化简
- 数值计算与符号计算对比
- 无穷连乘积精度控制
- 可变参数函数编写与调用

详情见：`实验一/README.md`

### 实验二：二维与三维图形绘制

- 非均匀采样下的 `sin(1/t)` 绘图
- 典型极坐标曲线绘制
- 多种三维曲面可视化方法对比
- 曲面区域剪切（`NaN` 掩膜）

详情见：`实验二/README.md`

### 实验三：数值计算与符号计算

- 矩阵方程求解
- 齐次线性方程组基础解系
- Lotka-Volterra 模型数值求解
- Laplace 变换符号计算

详情见：`实验三/README.md`

### 实验四：控制系统建模与离散化分析

- 连续/离散传递函数构造
- 差分方程到离散传递函数转换
- 状态空间模型转换与零极点分析
- 不同采样周期下离散化阶跃响应比较

详情见：`实验四/README.md`

### 实验五：状态空间分析与离散化

- 自治系统状态方程解析解与数值解比较
- 5阶状态空间模型单位阶跃响应分析
- 连续传递函数在不同采样周期下的离散化及误差分析

详情见：`实验五/README.md`

### 实验六：根轨迹与频域分析

- 状态方程系统根轨迹与稳定增益范围求解
- 关于参数 a 的根轨迹绘制与稳定区间搜索
- 带纯延迟系统的 Bode 图、Nyquist 图与稳定性判定
- 连续系统与离散系统的频域裕度分析

详情见：`实验六/README.md`

### 实验八：Simulink 仿真建模

- 编程式创建 Simulink 模型
- 四阶微分方程模拟结构图分解
- Integrator 串联降阶与负反馈实现
- MATLAB 脚本自动生成与运行 Simulink 模型

详情见：`实验八/README.md`

## 运行环境

- MATLAB R2023a 或更高版本
- 推荐工具箱：
  - Symbolic Math Toolbox
  - Control System Toolbox

## 快速开始

1. 使用 MATLAB 打开本项目根目录。
2. 进入对应实验目录并运行主程序，例如：

```matlab
cd 实验一
main01

cd ../实验二
main03

cd ../实验三
main02

cd ../实验四
main04

cd ../实验五
main01

cd ../实验六
main01

cd ../实验八
simlink
```

3. 查看各实验目录下的 `res/` 截图和 `README.md` 说明。

## 说明

- 各实验的详细题目说明、源程序、代码解析和运行结果，优先查看对应实验目录下的 `README.md`。
- `.doc` 文件为课程实验报告文档，`.m` 文件为 MATLAB 源程序。