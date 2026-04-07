% 声明符号变量
syms x s;

% 定义多项式 f(x)
f = x^5 + 3*x^4 + 4*x^3 + 2*x^2 + 3*x + 6;

% 使用 subs 函数进行变量替换
f_s = subs(f, x, (s-1)/(s+1));

% 将结果化简，以便于观察
f_s_simplified = simplify(f_s);

% 显示结果
disp('替换并化简后的 s 函数为：');
disp(f_s_simplified);