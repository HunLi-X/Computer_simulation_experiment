% 创建网格
x = linspace(-2, 2, 200);
y = linspace(-2, 2, 200);
[X, Y] = meshgrid(x, y);

% 计算完整的 z = sin(x*y)
Z = sin(X .* Y);

% 将圆形区域 x^2 + y^2 <= 0.5^2 内的点设为 NaN（剪切掉，不保留）
mask = (X.^2 + Y.^2) <= 0.5^2;
Z(mask) = NaN;

% 绘制剪切后的表面图
figure;
surf(X, Y, Z);
shading interp;
xlabel('x');
ylabel('y');
zlabel('z');
title('z = sin(xy) 剪切掉 x^2 + y^2 \leq 0.5^2 区域');
colormap('jet');
colorbar;
axis tight;
view(-30, 30);
