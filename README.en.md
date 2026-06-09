[简体中文](README.md) | English

<div align="center">
<h1>Computer Simulation Lab</h1>


![MATLAB](https://img.shields.io/badge/MATLAB-R2023a+-orange)
![Labs](https://img.shields.io/badge/Labs-9-blue)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

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


<p>This repository contains code and results for the Computer Simulation course, primarily using MATLAB for basic modeling, numerical computation, visualization, and control system analysis.</p>

<img src="https://cnb.cool/66666/resource/-/git/raw/main/img/hengtiao.gif" width="100%" height="3">
</div><br>


## Project Goals

- Master MATLAB basic syntax, matrix operations, and script writing
- Understand symbolic computation, numerical methods, and error analysis
- Learn 2D/3D data visualization and result presentation
- Explore modeling and analysis of continuous and discrete systems
- Master programmatic Simulink modeling and simulation techniques

## Directory Structure

```text
lab/
├─ README.md
├─ Lab 1/
│  ├─ README.md
│  ├─ main01.m ~ main05.m
│  ├─ mat_add.m
│  └─ res/
├─ Lab 2/
│  ├─ README.md
│  ├─ main01.m ~ main04.m
│  └─ res/
├─ Lab 3/
│  ├─ README.md
│  ├─ main01.m ~ main04.m
│  └─ res/
├─ Lab 4/
│  ├─ README.md
│  ├─ main01.m ~ main04.m
│  └─ res/
├─ Lab 5/
│  ├─ README.md
│  ├─ main01.m ~ main03.m
│  └─ res/
├─ Lab 6/
│  ├─ README.md
│  ├─ main01.m ~ main03.m
│  └─ res/
└─ Lab 8/
   ├─ README.md
   ├─ simlink.m
   ├─ FourOrderODE_Simulation.slx
   └─ res/
└─ Lab 9/
│  ├─ README.md
│  ├─ myfirstsfcn.m
│  ├─ exp_sfcn.slx
│  └─ res/
└─ Lab 10/
   ├─ README.md
   ├─ main01.m
   ├─ main02.m
   └─ res/
```

## Lab Overview

### Lab 1: MATLAB Basics

- Matrix and complex number operations
- Symbolic substitution and simplification
- Numerical vs. symbolic computation comparison
- Infinite product with precision control
- Variable-argument function design

See: `实验一/README.md`

### Lab 2: 2D & 3D Graphics

- Non-uniform sampling of `sin(1/t)`
- Polar coordinate plots
- Multi-view 3D surface visualization
- Surface clipping with `NaN` masking

See: `实验二/README.md`

### Lab 3: Numerical & Symbolic Computation

- Matrix equation solving
- Fundamental solution set of homogeneous linear systems
- Lotka-Volterra model numerical solution
- Laplace transform symbolic computation

See: `实验三/README.md`

### Lab 4: Control System Modeling & Discretization

- Continuous/discrete transfer function construction
- Difference equation to transfer function conversion
- State-space to transfer function and pole-zero analysis
- Step response comparison under different sampling periods

See: `实验四/README.md`

### Lab 5: State-Space Analysis & Discretization

- Analytical vs. numerical solutions of autonomous state equations
- Unit step response of a 5th-order state-space model
- Discretization error analysis across sampling periods

See: `实验五/README.md`

### Lab 6: Root Locus & Frequency Domain Analysis

- Root locus and stable gain range for state-space systems
- Root locus with respect to parameter `a` and stability interval search
- Bode, Nyquist, and stability analysis for systems with pure delay
- Frequency-domain margin analysis for continuous and discrete systems

See: `实验六/README.md`

### Lab 8: Simulink Simulation

- Programmatic Simulink model creation
- Block diagram decomposition of a 4th-order ODE
- Integrator cascade and negative feedback implementation
- MATLAB script-driven automatic model generation and execution

See: `实验八/README.md`

### Lab 9: S-Function Development

- Level-1 MATLAB S-Function structure and callback mechanism
- Continuous state equation implementation in S-Function
- S-Function module integration and testing in Simulink
- Deep understanding of Simulink simulation engine

See: `实验九/README.md`

### Lab 10: Step Response and PID Controller Comparison

- Second-order unity negative feedback system modeling
- Unit step response plotting and performance index extraction
- P, PI, and PID controller design with closed-loop response comparison
- Analysis of controller parameters on system dynamic performance

See: `实验十/README.md`

## Environment

- MATLAB R2023a or later
- Recommended toolboxes:
  - Symbolic Math Toolbox
  - Control System Toolbox

## Quick Start

1. Open the project root in MATLAB.
2. Navigate to a lab folder and run the main script:

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

cd ../实验九
open_system('exp_sfcn')
sim('exp_sfcn')

cd ../实验十
main01
main02
```

3. Check the `res/` folder and `README.md` in each lab for results and details.

## Notes

- For detailed problem descriptions, source code, analysis, and results, refer to each lab's `README.md`.
- `.doc` files are course lab reports; `.m` files are MATLAB source code.