% 初始化变量
n = 1;
S_current = 1 + 2 / n^2; % 初始的连乘项
S_prev = 0;              % 前一次的乘积记录

% 使用 while 循环控制精度：当两次计算的差值小于 10^-12 时停止
while abs(S_current - S_prev) >= 1e-12
    S_prev = S_current;
    n = n + 1;
    S_current = S_current * (1 + 2 / n^2);
end

% 打印结果
fprintf('计算精度达到 10^-12 级时的 S = %.12f\n', S_current);
fprintf('此时迭代的项数 n = %d\n', n);