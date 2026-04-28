s = tf('s');
G_s = ((s+1)^2 * (s^2 + 2*s + 400)) / ((s+5)^2 * (s^2 + 3*s + 100) * (s^2 + 3*s + 2500));

Ts_list = [0.01, 0.1, 1];
figure; hold on;

% 绘制连续系统阶跃响应
[y_c, t_c] = step(G_s);
plot(t_c, y_c, 'k', 'LineWidth', 2);

% 循环离散化并绘图
colors = {'r--', 'b-.', 'g:'};
for i = 1:length(Ts_list)
    Ts = Ts_list(i);
    G_z = c2d(G_s, Ts, 'zoh');
    [y_d, t_d] = step(G_z);
    plot(t_d, y_d, colors{i}, 'LineWidth', 1.5);
end

legend('连续系统', 'T=0.01s', 'T=0.1s', 'T=1s');
title('不同采样周期下的离散化阶跃响应比较');
xlabel('时间 (s)');
ylabel('幅值');
grid on;
hold off;
