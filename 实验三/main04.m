clc;
syms t s alpha real

% 定义函数
f1 = sin(alpha*t) / t;
f2 = t^5 * sin(alpha*t);

% 计算 Laplace 变换
F1 = laplace(f1, t, s);
F2 = laplace(f2, t, s);

% 显示结果
disp('f1(t) = sin(αt)/t 的 Laplace 变换:');
pretty(simplify(F1));

disp('f2(t) = t^5 sin(αt) 的 Laplace 变换:');
pretty(simplify(F2));
