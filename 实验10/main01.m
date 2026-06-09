% 实验1
% 建立开环系统模型
num = [25];
den = [1 4 25];
G = tf(num, den);

% 建立单位负反馈闭环系统模型
sys_cl = feedback(G, 1); 

% 显示闭环传递函数
disp('闭环传递函数为：');
sys_cl
figure(1);
step(sys_cl);
title('实验1：单位阶跃响应曲线');
grid on;
% 获取阶跃响应性能指标
info = stepinfo(sys_cl);

tr = info.RiseTime;
tp = info.PeakTime;
overshoot = info.Overshoot;
ts = info.SettlingTime;

fprintf('上升时间 (Rise Time): %.4f s\n', tr);
fprintf('峰值时间 (Peak Time): %.4f s\n', tp);
fprintf('超调量 (Overshoot): %.4f %%\n', overshoot);
fprintf('调节时间 (Settling Time): %.4f s\n', ts);