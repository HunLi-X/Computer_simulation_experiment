% 使用非均匀步距绘制 sin(1/t)
% 在0附近使用非常小的步长（对数间隔），远离0处使用较大步长
t_neg = -logspace(0, -4, 1000); % 负半轴，从-1到接近0
t_pos = logspace(-4, 0, 1000);  % 正半轴，从接近0到1
t = [t_neg, t_pos]; % 合并
y = sin(1./t);

figure;
plot(t, y, 'b-', 'LineWidth', 1);
xlabel('t');
ylabel('sin(1/t)');
title('函数 sin(1/t) 在 t \in (-1, 1) 的图形');
grid on;
xlim([-1, 1]);
ylim([-1.5, 1.5]);
