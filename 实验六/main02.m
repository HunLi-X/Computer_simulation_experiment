%% 实验二：关于参数 a 的根轨迹
% 开环传递函数：
%                0.3 (s+2)(s^2 + 2.1s + 2.23)
%   G(s) = --------------------------------------
%            s^2 (s^2 + 3s + 4.32) (s + a)
%
% 闭环特征方程: s^2(s^2+3s+4.32)(s+a) + 0.3(s+2)(s^2+2.1s+2.23) = 0
% 改写为: P(s) + a*Q(s) = 0, 即 1 + a*Q(s)/P(s) = 0
%
% P(s) = s^3(s^2+3s+4.32) + 0.3(s+2)(s^2+2.1s+2.23)
% Q(s) = s^2(s^2+3s+4.32)

clear; clc; close all;

%% 1. 构造 P(s) 和 Q(s)
P_part1 = conv(conv([1 0 0], [1 3 4.32]), [1 0]);   % s^3(s^2+3s+4.32)
P_part2 = 0.3 * conv([1 2], [1 2.1 2.23]);           % 0.3(s+2)(s^2+2.1s+2.23)

% 对齐相加
L = max(length(P_part1), length(P_part2));
P = [zeros(1, L-length(P_part1)) P_part1] + ...
    [zeros(1, L-length(P_part2)) P_part2];

Q = conv([1 0 0], [1 3 4.32]);    % s^2(s^2+3s+4.32)

fprintf('P(s) 系数: '); disp(P);
fprintf('Q(s) 系数: '); disp(Q);

%% 2. 等效传递函数 G_eq = Q/P, rlocus 绘制关于 a 的根轨迹
G_eq = tf(Q, P);

fprintf('等效传递函数 G_eq(s) = Q(s)/P(s):\n');
G_eq

figure('Name','实验二 关于a的根轨迹','Color','w');
rlocus(G_eq);
grid on;
title('G(s) 关于参数 a 的根轨迹');
xlabel('实轴'); ylabel('虚轴');

%% 3. 数值搜索稳定区间
a_vec = 0:0.01:30;
stab_flag = false(size(a_vec));

for i = 1:length(a_vec)
    a = a_vec(i);
    % 分母: s^2(s^2+3s+4.32)(s+a)
    den_full = conv(conv([1 0 0], [1 3 4.32]), [1 a]);
    % 分子: 0.3(s+2)(s^2+2.1s+2.23)
    num_full = 0.3 * conv([1 2], [1 2.1 2.23]);

    L = max(length(den_full), length(num_full));
    d_pad = [zeros(1, L-length(den_full)) den_full];
    n_pad = [zeros(1, L-length(num_full)) num_full];
    char_poly = d_pad + n_pad;

    r = roots(char_poly);
    stab_flag(i) = all(real(r) < 0);
end

% 找出稳定区间边界
idx = find(stab_flag);
if isempty(idx)
    fprintf('在搜索范围内未找到稳定区间。\n');
else
    da      = diff(idx);
    gap_pos = find(da > 1);
    if isempty(gap_pos)
        starts = idx(1);
        ends   = idx(end);
    else
        starts = [idx(1),        idx(gap_pos + 1)];
        ends   = [idx(gap_pos),  idx(end)];
    end
    fprintf('\n使闭环系统稳定的 a 值范围：\n');
    for k = 1:length(starts)
        fprintf('   %.3f  <=  a  <=  %.3f\n', ...
                a_vec(starts(k)), a_vec(ends(k)));
    end
end

%% 4. 不同 a 值验证
a_test = [0.5, 1.26, 2, 5];
figure('Name','实验二 不同a下阶跃响应','Color','w');
for i = 1:length(a_test)
    a = a_test(i);
    den_full = conv(conv([1 0 0], [1 3 4.32]), [1 a]);
    num_full = 0.3 * conv([1 2], [1 2.1 2.23]);
    G_ol = tf(num_full, den_full);
    sys_cl = feedback(G_ol, 1);

    subplot(2,2,i);
    p = pole(sys_cl);
    if all(real(p) < 0)
        step(sys_cl, 20);
        title(sprintf('a = %.2f (稳定)', a));
    else
        t = 0:0.01:3;
        [y, t_out] = impulse(sys_cl, t);
        plot(t_out, y);
        ylim([-10 10]);
        title(sprintf('a = %.2f (不稳定)', a));
    end
    grid on;
end
sgtitle('不同 a 值的闭环阶跃响应');
