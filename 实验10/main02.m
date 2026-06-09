% 实验2
% 1. 建立被控对象
G = tf([1], [1, 2, 0]);

% 2. 设计控制器
% P 控制
Kp = 20;
C_p = tf(Kp, 1); 
sys_p = feedback(C_p * G, 1);

% PI 控制 (引入积分环节)
Ki = 6;
C_pi = tf([Kp Ki], [1 0]);  % Kp + Ki/s
sys_pi = feedback(C_pi * G, 1);

% PID 控制 (在PI基础上引入微分)
Kd = 3;
C_pid = tf([Kd Kp Ki], [1 0]);  % Kd*s + Kp + Ki/s
sys_pid = feedback(C_pid * G, 1);

% 3. 绘制阶跃响应曲线
figure(2);
step(sys_p, sys_pi, sys_pid);
legend('P控制', 'PI控制', 'PID控制', 'Location', 'SouthEast');
title('实验2：不同控制器的单位阶跃响应');
grid on;