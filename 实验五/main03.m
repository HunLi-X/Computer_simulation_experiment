%% 实验三：连续传递函数在不同采样周期下的离散化及响应比较
%  G(s) = (-2s^2 + 3s - 4) / (s^3 + 3.2s^2 + 1.61s + 3.03)

clc; clear; close all;

%% 定义连续系统传递函数
num = [-2, 3, -4];
den = [1, 3.2, 1.61, 3.03];
Gc = tf(num, den);

fprintf('连续系统传递函数:\n');
disp(Gc);

%% 检查连续系统稳定性
poles_c = pole(Gc);
fprintf('连续系统极点:\n');
disp(poles_c);

%% 定义不同的采样周期
T_values = [0.01, 0.1, 1];

%% ============ 图1：不同采样周期离散化后的阶跃响应对比 ============
figure('Name', '离散化阶跃响应比较', 'Position', [50 50 1000 500]);

% 连续系统阶跃响应作为参考
t_cont = 0:0.001:10;
y_cont = step(Gc, t_cont);
plot(t_cont, y_cont, 'k-', 'LineWidth', 2.5); hold on;

% 对每个采样周期进行 ZOH 离散化并绘制阶跃响应
plot_colors = {'b', 'r', 'm'};
plot_styles = {'--', '-.', ':'};

for k = 1:length(T_values)
    T = T_values(k);
    Gd = c2d(Gc, T, 'zoh');

    fprintf('\n--- 采样周期 T = %.3f s ---\n', T);
    fprintf('离散传递函数:\n');
    disp(Gd);
    fprintf('离散极点:\n');
    disp(pole(Gd));

    % 离散系统阶跃响应
    [y_d, t_d] = step(Gd, 10);
    plot(t_d, y_d, 'Color', plot_colors{k}, ...
         'LineStyle', plot_styles{k}, 'LineWidth', 1.8);
end

xlabel('时间 t / s', 'FontSize', 12);
ylabel('输出 y(t)', 'FontSize', 12);
title('连续系统与不同采样周期离散化系统的阶跃响应对比', 'FontSize', 14);
legend({'连续系统', 'T=0.01s', 'T=0.1s', 'T=1s'}, ...
       'Location', 'best', 'FontSize', 11);
grid on;

%% ============ 图2：不同采样周期的误差分析 ============
figure('Name', '离散化误差分析', 'Position', [50 50 1000 700]);

plot_colors_bar = {'b', 'r', 'm'};

for k = 1:length(T_values)
    T = T_values(k);
    Gd = c2d(Gc, T, 'zoh');

    % 离散阶跃响应
    [y_d, t_d] = step(Gd, 10);

    % 对应时刻的连续系统响应（插值）
    y_d_interp = interp1(t_cont, y_cont, t_d);

    % 计算误差
    err_vals = y_d(:) - y_d_interp(:);

    subplot(length(T_values), 1, k);
    bar(t_d, err_vals, plot_colors_bar{k});
    xlabel('时间 t / s');
    ylabel('误差');
    title(sprintf('T = %.3f s 时的离散化误差 (最大误差 = %.4f)', T, max(abs(err_vals))));
    grid on;
end
sgtitle('不同采样周期下的离散化误差', 'FontSize', 13, 'FontWeight', 'bold');

%% ============ 图3：极点位置对比（z平面） ============
figure('Name', 'z平面极点对比', 'Position', [50 50 800 500]);

theta = 0:0.01:2*pi;
plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1); hold on;

markers = {'o', 's', 'd'};
for k = 1:length(T_values)
    T = T_values(k);
    Gd = c2d(Gc, T, 'zoh');
    p = pole(Gd);
    plot(real(p), imag(p), markers{k}, 'Color', plot_colors{k}, ...
         'MarkerSize', 10, 'LineWidth', 2);
end

xlabel('实部'); ylabel('虚部');
title('离散系统极点在 z 平面上的位置');
legend({'单位圆', 'T=0.01s', 'T=0.1s', 'T=1s'}, 'Location', 'best');
axis equal; grid on;
xlim([-1.5 1.5]); ylim([-1.5 1.5]);

%% ============ 结论输出 ============
fprintf('\n==================== 结论 ====================\n');
fprintf('1. 采样周期越小（如 T=0.01s），离散系统响应越接近连续系统。\n');
fprintf('2. 采样周期越大（如 T=1s），离散化带来的误差越大，响应失真越明显。\n');
fprintf('3. 所有离散化后的极点均在单位圆内，系统保持稳定。\n');
fprintf('4. 采样周期的选择应在系统带宽与计算负担之间取得平衡。\n');
fprintf('=============================================\n');
