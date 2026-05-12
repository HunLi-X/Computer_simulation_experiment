%% 实验一：状态方程系统根轨迹与稳定性分析
clc; clear; close all;

% 定义状态空间矩阵
A = [-1.5, -13.5, -13, 0;
      10,    0,     0,  0;
      0,     1,     0,  0;
      0,     0,     1,  0];
B = [1; 0; 0; 0];
C = [0, 0, 0, 1];
D = 0;

% 转为传递函数
sys_ss = ss(A, B, C, D);
sys_tf = tf(sys_ss);

fprintf('开环传递函数 G(s):\n');
sys_tf

% 绘制根轨迹
figure(1);
rlocus(sys_tf);
title('实验一: 状态方程系统根轨迹');
xlabel('实部'); ylabel('虚部');
grid on;
set(gcf, 'Position', [100 100 800 600]);
drawnow;

% 求稳定的 K 范围
[num, den] = tfdata(sys_tf, 'v');

stable_K = [];
for K = 0:0.005:500
    poles = roots(den + K * num);
    if all(real(poles) < 0)
        stable_K = [stable_K, K];
    end
end

if ~isempty(stable_K)
    fprintf('\n====================================\n');
    fprintf('使得闭环系统稳定的 K 值范围: [%.4f, %.4f)\n', ...
            min(stable_K), max(stable_K));
    fprintf('====================================\n');
end

% 验证: 阶跃响应
K_opt = 50;
T_cl = feedback(K_opt * sys_tf, 1);

figure(2);
step(T_cl, 5);
title(sprintf('实验一: K = %d 时闭环阶跃响应', K_opt));
xlabel('时间 (s)'); ylabel('幅值');
grid on;
set(gcf, 'Position', [100 100 800 600]);
drawnow;
