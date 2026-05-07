%% 实验二：状态方程模型的单位阶跃响应
clc; clear; close all;

%% 定义系统矩阵
A = [-0.2   0.5    0      0     0;
      0    -0.5   1.6     0     0;
      0     0    -14.3   85.8   0;
      0     0     0     -33.3  100;
      0     0     0      0    -10];

B = [0; 0; 0; 0; 30];

C = [1, 0, 0, 0, 0];

D = 0;

%% 建立状态空间模型
sys = ss(A, B, C, D);

%% 绘制输出 y(t) 的单位阶跃响应
figure('Name', '输出阶跃响应', 'Position', [100 100 800 400]);
step(sys, 35);
title('状态方程模型的单位阶跃响应 y(t)', 'FontSize', 14);
xlabel('时间 t / s', 'FontSize', 12);
ylabel('y(t)', 'FontSize', 12);
grid on;

%% 查看各状态变量的阶跃响应
figure('Name', '各状态变量阶跃响应', 'Position', [100 100 900 600]);

t = 0:0.01:35;
[y_step, t_step, x_step] = step(sys, t);

subplot(2,1,1);
plot(t_step, y_step, 'b-', 'LineWidth', 2);
xlabel('时间 t / s'); ylabel('y(t)');
title('输出 y(t) 的阶跃响应');
grid on;

subplot(2,1,2);
% x_step 的维度为 [length(t), 1, 5]，需要 squeeze 降维
x_2d = squeeze(x_step);  % 变为 [length(t) x 5]
for i = 1:5
    plot(t_step, x_2d(:, i), 'LineWidth', 1.5); hold on;
end
xlabel('时间 t / s'); ylabel('状态变量');
title('各状态变量的阶跃响应');
legend('x_1', 'x_2', 'x_3', 'x_4', 'x_5', 'Location', 'best');
grid on;
