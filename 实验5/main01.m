%% 实验一：自治系统状态方程解析解与数值解比较
%  dx/dt = A*x,  x(0) = x0

clc; clear; close all;

%% 定义系统矩阵和初始条件
A = [-5  2  0  0;
      0 -4  0  0;
     -3  2 -4 -1;
     -3  2  0 -4];

x0 = [1; 2; 0; 1];

%% ============ 方法一：解析解 x(t) = expm(A*t) * x0 ============
t_span = 0:0.01:5;

% 计算解析解（逐时刻用矩阵指数）
x_exact = zeros(4, length(t_span));
for i = 1:length(t_span)
    x_exact(:, i) = expm(A * t_span(i)) * x0;
end

%% ============ 方法二：数值解（ode45 求解） ============
[t_num, x_num] = ode45(@(t, x) A * x, t_span, x0);

%% ============ 绘图比较 ============
figure('Name', '解析解 vs 数值解', 'Position', [100 100 900 700]);

titles = {'x_1(t)', 'x_2(t)', 'x_3(t)', 'x_4(t)'};

for i = 1:4
    subplot(2, 2, i);
    plot(t_span, x_exact(i, :), 'b-', 'LineWidth', 2); hold on;
    plot(t_num, x_num(:, i), 'ro', 'MarkerSize', 4, 'MarkerIndices', 1:10:length(t_num));
    xlabel('时间 t / s');
    ylabel(titles{i});
    title(titles{i});
    legend('解析解', '数值解', 'Location', 'best');
    grid on;
end

sgtitle('自治系统状态方程：解析解与数值解比较', 'FontSize', 14, 'FontWeight', 'bold');

%% 打印误差信息
fprintf('解析解与数值解的最大绝对误差:\n');
for i = 1:4
    err = max(abs(x_exact(i, :) - interp1(t_num, x_num(:, i), t_span)));
    fprintf('  x_%d: %.2e\n', i, err);
end
