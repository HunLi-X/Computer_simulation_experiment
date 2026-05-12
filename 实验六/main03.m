%% 实验三：带延迟系统的频域分析
clc; clear; close all;

%% ========== 第1部分: 连续系统 G(s) ==========
fprintf('========== 第1部分: 连续系统 G(s) ==========\n');

s = tf('s');

% 开环传递函数 (不含延迟)
G_num = (-2*s + 1);
G_den = s^2 * (s^2 + 3*s + 3) * (s + 5) * (s^2 + 2*s + 6);
G_rat = G_num / G_den;

% 加入延迟 e^{-3s}
tau = 3;
G_pade  = pade(G_rat * exp(-tau*s), 10);  % 10阶Pade近似(用于闭环极点计算)
G_exact = G_rat * exp(-tau*s);            % 精确延迟(用于频域分析)

% 计算裕度
[Gm, Pm, Wcg, Wcp] = margin(G_exact);
fprintf('增益裕度 Gm: %.4f (倍) = %.4f dB\n', Gm, 20*log10(Gm));
fprintf('相位裕度 Pm: %.4f deg\n', Pm);
fprintf('穿越频率 Wcg: %.4f rad/s\n', Wcg);
fprintf('剪切频率 Wcp: %.4f rad/s\n', Wcp);

% 闭环稳定性判定
T_cl_G = feedback(G_pade, 1);
poles_G = pole(T_cl_G);
is_stable_G = all(real(poles_G) < 0);

fprintf('\n闭环极点实部:\n');
disp(sort(real(poles_G), 'descend')');

if is_stable_G
    fprintf('判定: 闭环系统 G(s) 是稳定的\n');
else
    fprintf('判定: 闭环系统 G(s) 是不稳定的\n');
end

% --- 图1: 连续系统 G(s) 综合分析 (2×2 布局) ---
figure('Name', '连续系统 G(s) 分析', 'Position', [50 50 1200 750]);

% Bode 幅频与相频
[mag_G, phase_G, w_G] = bode(G_exact);
mag_G   = squeeze(mag_G);
phase_G = squeeze(phase_G);

subplot(2,2,1);
semilogx(w_G, 20*log10(mag_G), 'b', 'LineWidth', 1.5);
xlabel('频率 (rad/s)'); ylabel('幅值 (dB)');
title(sprintf('G(s) Bode 幅频 (Gm=%.2f dB)', 20*log10(Gm)));
grid on;

subplot(2,2,2);
semilogx(w_G, phase_G, 'r', 'LineWidth', 1.5);
xlabel('频率 (rad/s)'); ylabel('相位 (deg)');
title(sprintf('G(s) Bode 相频 (Pm=%.2f°)', Pm));
grid on;

% Nyquist 图
subplot(2,2,3);
nyquist(G_exact);
title('G(s) Nyquist 图');
grid on;

% 闭环阶跃响应 (Pade近似)
subplot(2,2,4);
step(T_cl_G, 20);
title('G(s) 闭环阶跃响应 (Pade近似)');
xlabel('时间 (s)'); ylabel('幅值');
grid on;

sgtitle('连续系统 G(s) 频域与时域综合分析', 'FontSize', 14, 'FontWeight', 'bold');
drawnow;

%% ========== 第2部分: 离散系统 H(z) ==========
fprintf('\n========== 第2部分: 离散系统 H(z) ==========\n');

T_sample = 0.05;

% 定义离散传递函数 (不含延迟)
H_num_z = [1, 0, 0.568];
H_den_z = conv([1, -1], [1, -0.2, 0.99]);
H_rat_z = tf(H_num_z, H_den_z, T_sample);

% 离散延迟 z^{-5}
H_delay = tf([1], [1, 0, 0, 0, 0, 0], T_sample);
H_z = H_rat_z * H_delay;

fprintf('离散开环传递函数 H(z):\n');
H_z

[Gm_d, Pm_d, Wcg_d, Wcp_d] = margin(H_z);
fprintf('增益裕度 Gm: %.4f (倍) = %.4f dB\n', Gm_d, 20*log10(Gm_d));
fprintf('相位裕度 Pm: %.4f deg\n', Pm_d);

% 离散闭环稳定性判定
T_cl_H = feedback(H_z, 1);
poles_H = pole(T_cl_H);
is_stable_H = all(abs(poles_H) < 1);

fprintf('\n闭环极点模值:\n');
disp(sort(abs(poles_H), 'descend')');

if is_stable_H
    fprintf('判定: 离散闭环系统 H(z) 是稳定的\n');
else
    fprintf('判定: 离散闭环系统 H(z) 是不稳定的\n');
end

% --- 图2: 离散系统 H(z) 综合分析 (2×2 布局) ---
figure('Name', '离散系统 H(z) 分析', 'Position', [100 100 1200 750]);

[mag_H, phase_H, w_H] = bode(H_z);
mag_H   = squeeze(mag_H);
phase_H = squeeze(phase_H);

subplot(2,2,1);
semilogx(w_H, 20*log10(mag_H), 'b', 'LineWidth', 1.5);
xlabel('频率 (rad/s)'); ylabel('幅值 (dB)');
title(sprintf('H(z) Bode 幅频 (Gm=%.2f dB)', 20*log10(Gm_d)));
grid on;

subplot(2,2,2);
semilogx(w_H, phase_H, 'r', 'LineWidth', 1.5);
xlabel('频率 (rad/s)'); ylabel('相位 (deg)');
title(sprintf('H(z) Bode 相频 (Pm=%.2f°)', Pm_d));
grid on;

subplot(2,2,3);
nyquist(H_z);
title('H(z) Nyquist 图');
grid on;

subplot(2,2,4);
step(T_cl_H, 3);
title('H(z) 闭环阶跃响应');
xlabel('时间 (s)'); ylabel('幅值');
grid on;

sgtitle('离散系统 H(z) 频域与时域综合分析', 'FontSize', 14, 'FontWeight', 'bold');
drawnow;

fprintf('\n========== 全部完成 ==========\n');
