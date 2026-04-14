[English](README.en.md) | 简体中文

<div align="center">
<h1>计算机仿真实验</h1>


[![MATLAB](https://img.shields.io/badge/MATLAB-R2023a-orange)](https://www.mathworks.com/products/matlab.html)
[![实验](https://img.shields.io/badge/实验-1-blue)](./)
[![版本](https://img.shields.io/badge/版本-1.0-green)](./)

[![Auth](https://img.shields.io/badge/Auther--HunLi-ff69b4.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAADZElEQVR4nO2ZX2iPURjHP/7/aZN/E21DaZvtwoVYyQUuGXLB/LtkLRcUhSJMSVwg3KCUJPJvLmRZtMQFLvwZhUJk/saGLWaYV6eet06n9/3tfd+9531/sW89td9z3vOc8z3nPOc8zzPoQQ+yAnlAA/AbcCzKR2ClTSL7LRNwNPkB5Noi0pggEQeYbovIh4SJLLBBojfwK2EiVTaIjEyYhANsskGkNAUi+2wQmZECkRM2iCxMgUi9DSKrxPhS7GOZjHXPhvGtYlwdMduYKWO9tmH8oBgvxj6KZawOoFfcxk+L8RzsI0fzkyFhO28EvqXg0FHlK1DtReRzFkzOCSmfvIhczIKJOSHlmheRgcAK4E4WTNDpQp4Ba4P4zxRgO3ArgSQqqDQDx4AKCWBDYwSwRDP4JWECG4CpQB9iwCTNsBsJl8srvxk4CtQBN4Enkre0GKQ7RaekCXgAXAcuAHuB1bLaZcAgrd+2uK78ai0PsfLSBshG70u9IDJmyUq2AYvlbD5N4Dg9l/EnArdFV9sdIlfEiLrNzFAlqPwE2kP2OaKNlyfH8Q9QFJVIixgepukqIuTdRRI3Be1TaczjnOgXRSXyTgwUarrBIVb4htbvcMA+nR7+UCdtc6MSOS8G9hj6+gjlnHEBd+WuMVaZ9FMyJiqRydrgB4B80VcFmFBtxALfFm3nlwPv48rfK7WoWDkc8jgpYq0eE/kOnAGG+4RBh3z6qTGOyzfIJeG2nQL6EQMmaEaTgtNdv+jKcFJwbI33XxEpAM76+IArrXIbFqVFpE0MuzeXF4nmEI9ecwZbhVo6GzsaxLhnniw74YQUVdDwwjppv2yzaPbIJ7HJdJz8RIX5JgYAL6V9vg0ifYEXMsAaj3Z3cpfkmPmhQAs5vHxgh+gbbdS0XMyTQdrkbdHhTiwTCdMHTCLl8hCqeGsalnFSO2JDNb3XxOZINqhkttFmfq8W4I1PbGcFuVr21qCloe7EarRvmzT9K01fYxAZJVmgA1yNKxwh4NF4q0Wr+UZs5JIxndskoVLoEskI1e/HRu6TCEpklR1ZebPcqk/YT9cu1UL190NgNCmhQGpfTjelLo2dMNEf2BkylXVF7eL6qAU3WyiVvCHIv7A7pBY2nizGWGC3FOr0XeoQZ96VIcbqAf8K/gLNGaTJ3vwbFgAAAABJRU5ErkJggg==)](https://github.com/HunLi-X)
[![cnb](https://img.shields.io/badge/CNB-xhunli-F76945?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAppJREFUOE9tk01rE1EUhs+5H5lJ0iQT3FRX2Yi4avoLkv4CWxBcNt11oZiuFKGmXQhFN6kuRESSgitXKf6A5g+I6cqFLiKCiptOkraZ5H4cuZOkH9oLw+UO8z7nvGfei3DFohoEQLAKCGWyGJCSbQZsD3ei7r+f45WATV6xmjdISyAlYLaDliveux+ti5ozwLAaFPhIlk6G6f18sxuO7l9bBiWbVoncDGCMWMl++PI/gJ7IohkmD0zkBxT5oRn5LTpN7ULqBByEtFywWvRyHz8Fx3dvN0UwuMPyR0uJFycddH7tKPHZRn7BjnwwkQcUud0HO/K7oOENcTYPRCEAFERmsCpyfZDZfpdnBosOUKGx13BC60QTIdjpmSzrEWDR+UagjsgMciLXAwfhc4MNpKfQtOPE6mVh0gEOaeTXtWXXEdADpJAR/GaZ/rrM9Us82wORPd5zHbRp7JVcyxR5PRP5LTPy6uo0HXIlG9awMgLuEUABkBYI7VLyxs+yyPW3+Nyg4zqoG+UV7TDRlMBbWA/D43u3qlbLGmgRWM2BjFxjQjWQGQBuu4bYYvrm14JMnQSXcjBcny9A5DXIiDJp9/8FWCXAAOaFUEfILTgIcttOvf+2NJnLdI0fBFUyskZKBGTEJEAmBuzr9LCSUDwGQAwwgMzu+m9/VWOAeZSsk+YP48C4li/sRok1nlBd5PogBjgxNw70PfHyqBADyEVXicasZXCVpxYiLfO+HxVZDHCVYwvu2ebPT7fOLNAm65AWLnEAzvsEcOi9/lPU1aACXDfOLdhD9kxNszGdweQGYstqXgItJwDFNxKvwrp57G8h0zVwldHuA0IFt8El83yIs2FSDcpgxDJpUUTwK7gTduN3AK5iG7ehc/E2/gUPD3q3eY4awwAAAABJRU5ErkJggq==)](https://cnb.cool/u/xhunli)

<p>本课程实验旨在通过MATLAB编程实践，掌握计算机仿真的基本原理和方法，培养解决实际问题的能力。</p>

<img src="https://cnb.cool/66666/resource/-/git/raw/main/img/hengtiao.gif" width="100%" height="3">
</div><br>

## ✨ 项目介绍

本仓库是**计算机仿真课程实验**的代码与报告合集，基于 MATLAB 进行编程实践。通过一系列由浅入深的实验，帮助学习者掌握：

- **MATLAB 基础编程**: 矩阵运算、符号计算、函数编写
- **数值仿真方法**: 迭代算法、精度控制、数值稳定性
- **问题建模能力**: 将实际问题转化为可计算的数学模型

### 📁 项目结构
```
实验/
├── 实验一/                 # MATLAB 基础操作
│   ├── README.md          # 实验一说明文档
│   ├── main01.m           # 矩阵与复数运算
│   ├── main02.m           # 符号变量与多项式
│   ├── main03.m           # 数值与符号计算对比
│   ├── main04.m           # 无穷连乘积计算
│   ├── main05.m           # 变参函数调用示例
│   ├── mat_add.m          # 变参矩阵加法函数
│   └── 计算机仿真实验报告模板.doc
├── 实验二/                 # 二维与三维图形绘制
│   ├── README.md          # 实验二说明文档
│   ├── main01.m           # sin(1/t) 非均匀步距绘图
│   ├── main02.m           # 极坐标曲线绘制
│   ├── main03.m           # 三维曲面多视图绘制
│   ├── main04.m           # 曲面区域剪切
│   └── 实验二.doc         # 实验报告模板
└── README.md
```


---

![Fork 历史趋势图。](https://commit.cool/forks/chief985/For_course/Computer_simulation_experiment?interval=day)