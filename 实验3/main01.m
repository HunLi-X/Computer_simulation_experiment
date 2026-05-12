% 定义矩阵 A 和 B
clc;
A = [7 6 9 7; 7 1 3 2; 2 1 5 5; 6 4 2 6];
B = [2 1 0 1; 0 3 1 2];

% 求解 X，使得 X * A = B
X = B / A;

% 显示解
disp('解矩阵 X =');
disp(X);

% 检验：计算 X * A 并与 B 比较
C = X * A;
disp('检验 X * A =');
disp(C);
disp('与矩阵 B 的差（应接近零）：');
disp(C - B);
