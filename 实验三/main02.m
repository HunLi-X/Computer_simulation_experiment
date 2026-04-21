% 定义微分方程函数
function dxy = lotka_volterra(t, xy)
    x = xy(1);
    y = xy(2);
    dxdt = 4*x - 2*x*y;
    dydt = x*y - 3*y;
    dxy = [dxdt; dydt];
end

% 设置时间区间和初始条件
tspan = [0 10]; % 可根据需要调整时间范围
xy0 = [2; 3];

% 求解微分方程
[t, xy] = ode45(@lotka_volterra, tspan, xy0);

% 提取解
x = xy(:, 1);
y = xy(:, 2);

% 绘制曲线
figure;
plot(t, x, 'b-', 'LineWidth', 1.5); hold on;
plot(t, y, 'r--', 'LineWidth', 1.5);
xlabel('时间 t');
ylabel('种群数量');
legend('猎物 x(t)', '捕食者 y(t)');
title('Lotka-Volterra 模型数值解');
grid on;
