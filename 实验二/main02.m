% 定义不同的theta范围
theta1 = linspace(0, 4*pi, 2000); % 对于螺旋线，取0到4π
theta2 = linspace(0, 8*pi, 4000); % 对于周期函数，取足够大以显示多个周期
theta3 = linspace(-20, 20, 4000); % 对于sinc函数，需要包含0点并观察衰减
theta4 = linspace(0, 2*pi, 2000); % 对于周期函数，取一个周期

% 计算对应的rho值
rho1 = 1.0013 * theta1.^2;
rho2 = cos(7*theta2/2);
rho3 = sin(theta3)./theta3; % 注意处理theta=0处的除法，MATLAB会返回NaN，但绘图时会自动处理
rho3(theta3 == 0) = 1; % 显式定义theta=0时rho=1
rho4 = 1 - cos(7*theta4).^3;

% 绘制四个极坐标子图
figure;
subplot(2,2,1);
polarplot(theta1, rho1, 'b');
title('① ρ = 1.0013θ^2');

subplot(2,2,2);
polarplot(theta2, rho2, 'r');
title('② ρ = cos(7θ/2)');

subplot(2,2,3);
polarplot(theta3, rho3, 'Color', [0 0.6 0]);
title('③ ρ = sin(θ)/θ');

subplot(2,2,4);
polarplot(theta4, rho4, 'm');
title('④ ρ = 1 - cos^3(7θ)');
