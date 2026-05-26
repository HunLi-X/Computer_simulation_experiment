[English](README.en.md) | 简体中文

<div align="center">
<h1>计算机仿真实验</h1>


![MATLAB](https://img.shields.io/badge/MATLAB-R2023a+-orange)
![实验数](https://img.shields.io/badge/实验-7-blue)
![状态](https://img.shields.io/badge/状态-持续更新-green)

<p align="center">
  <a href="https://github.com/HunLi-X">
    <img src="https://img.shields.io/badge/Auther--HunLi-ff69b4?style=flat&logo=github&logoColor=white" alt="Auth" />
  </a>
  <a href="https://cnb.cool/u/xhunli">
    <img src="https://img.shields.io/badge/CNB-xhunli-F76945?style=flat&logo=data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMzIwIDMyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCjxwYXRoIGQ9Ik0yMjguOTA2IDQwLjI0MTJDMjI5Ljg4MiAzNy41MTA4IDIyOC45MDYgMzQuMzkwMyAyMjYuNzU5IDMyLjQ0QzIxOS4zNDIgMjYuMDA0IDIwMC43OTkgMTIuMzUxOSAxNzMuMDgyIDEwLjQwMTZDMTQxLjg1MiA4LjA2MTIxIDEyMi41MjggMTYuNDQ3NSAxMTIuNzY5IDIyLjY4ODVDMTA4LjQ3NCAyNS40MTg5IDEwOC4yNzkgMzEuNDY0OSAxMTIuMTgzIDM0LjM5MDNMMTkxLjYyNSA5Ni4yMTQ5QzE5OC42NTIgMTAxLjY3NiAyMDguOTk3IDk4LjU1NTMgMjExLjcyOSA5MC4xNjlMMjI4LjcxMSA0MC4yNDEySDIyOC45MDZaIiBmaWxsPSIjRkY2MjAwIi8+DQo8cGF0aCBkPSJNMzIuOTM4MSAyMjMuNTY0QzI5LjYxOTkgMjI1LjcxIDI4LjI1MzYgMjI5LjgwNSAyOS4yMjk1IDIzMy41MTFDMzIuMTU3MyAyNDQuNDMyIDQxLjMzMTIgMjY2Ljg2MSA2Ni45MDA5IDI4Ny41MzRDOTIuNDcwNiAzMDguMDEyIDEyMi43MjUgMzEwLjM1MyAxMzUuNjA3IDMwOS45NjNDMTM5LjUxMSAzMDkuOTYzIDE0Mi44MjkgMzA3LjQyNyAxNDQgMzAzLjcyMkwxOTQuOTQ1IDE0Mi42MjdDMTk4LjY1MyAxMzAuOTI1IDE4NS41NzYgMTIxLjE3MyAxNzUuNDI2IDEyNy45OTlMMzIuOTM4MSAyMjMuNTY0WiIgZmlsbD0iI0ZGNjIwMCIvPg0KPHBhdGggZD0iTTcwLjIxNjkgNTMuNDk1NUM2Ny42Nzk0IDUyLjUyMDMgNjQuOTQ2OCA1Mi43MTUzIDYyLjYwNDUgNTMuODg1NUM1My4yMzU1IDU4Ljk1NjMgMjkuMDMyIDc0Ljc1MzggMTYuNTQgMTA3LjMyNEM2Ljc4MDU0IDEzMi4yODggMTAuMDk4NyAxNTkuOTgyIDEyLjgzMTQgMTczLjQzOUMxMy42MTIxIDE3Ny45MjUgMTguMjk2NyAxODAuNDYgMjIuNTkwOCAxNzguNzA1TDE3NS40MjQgMTE5LjAyNkMxODYuMzU0IDExNC43MzUgMTg2LjM1NCA5OS4zMjc2IDE3NS40MjQgOTUuMDM2OUw3MC4yMTY5IDUzLjQ5NTVaIiBmaWxsPSIjRkY2MjAwIi8+DQo8cGF0aCBkPSJNMjk3LjAzIDE2OC45NjhDMzAxLjUxOSAxNzEuODkzIDMwNy41NyAxNjkuMzU4IDMwOC4zNTEgMTY0LjA5MkMzMTAuMzAxIDE1MC4wNSAzMTIuMDYgMTI1Ljg2NiAzMDQuMDU3IDEwNy4zMzZDMjkzLjMyMSA4Mi45NTkxIDI3NC45NzQgNjcuNzQ2OCAyNjYuMTkgNjEuNzAwOEMyNjMuNDU4IDU5Ljc1MDUgMjU5Ljc0OSA1OS45NDU2IDI1Ny4yMTIgNjIuMjg1OUwyMTguNTY0IDk2LjQxNjJDMjEyLjMxOCAxMDIuMDcyIDIxMi45MDQgMTEyLjAxOSAyMTkuOTMxIDExNi42OTlMMjk3LjAzIDE2OC45NjhaIiBmaWxsPSIjRkY2MjAwIi8+DQo8cGF0aCBkPSJNMTg5LjA4OSAyOTkuNDI4QzE4OC42OTkgMzAzLjkxNCAxOTIuNjAzIDMwNy44MTQgMTk3LjA5MiAzMDcuMjI5QzIxMS43MzEgMzA1LjY2OSAyNDEuNzkgMjk5LjgxOCAyNjQuMjM3IDI3OC4zNjVDMjg2LjA5OCAyNTcuNDk2IDI5My4zMiAyMzIuNzI4IDI5NS4yNzIgMjIyLjc4MUMyOTUuODU4IDIyMC4wNTEgMjk1LjI3MiAyMTcuMzIgMjkzLjUxNSAyMTUuMTc1TDIyNS45OCAxMzEuODk3QzIxOC43NTggMTIyLjkyNSAyMDQuMTE5IDEyNy40MTEgMjAzLjE0MyAxMzguOTE4TDE4OS4wODkgMjk5LjIzM1YyOTkuNDI4WiIgZmlsbD0iI0ZGNjIwMCIvPg0KPC9zdmc+DQo=&logoColor=white" alt="CNB" />
  </a>
  <a href="https://hunli.100w.top/">
    <img src="https://img.shields.io/badge/Blog-HunLi-008080?style=flat&logo=googlechrome&logoColor=white" alt="Blog" />
  </a>
  <a href="https://space.bilibili.com/526083657">
    <img src="https://img.shields.io/badge/Bilibili-小昏黎-00A1D6?style=flat&logo=bilibili&logoColor=white" alt="Bilibili" />
  </a>
  <a href="https://wpa.qq.com/msgrd?v=3&uin=1255027942&site=qq&menu=yes">
    <img src="https://img.shields.io/badge/QQ-1255027942-EB1923?style=flat&logo=tencentqq&logoColor=white" alt="QQ" />
  </a>
</p>

<p>本仓库是计算机仿真课程实验代码与结果汇总，主要使用 MATLAB 完成基础建模、数值计算、图形绘制与控制系统分析。</p>

<img src="https://cnb.cool/66666/resource/-/git/raw/main/img/hengtiao.gif" width="100%" height="3">
</div><br>


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