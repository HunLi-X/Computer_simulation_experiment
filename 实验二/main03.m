% 定义公共网格范围
x = linspace(-2, 2, 50);
y = linspace(-2, 2, 50);
[X, Y] = meshgrid(x, y);

% 定义四个函数
Z1 = X .* Y;
Z2 = sin(X .* Y);
Z3 = sin(X.^2 - Y.^2);
Z4 = -X .* Y .* exp(-2*(X.^2 + Y.^2));

% 为每个函数创建一个图形窗口，展示多种视图
functions = {Z1, Z2, Z3, Z4};
titles = {'f(x,y) = xy', 'f(x,y) = sin(xy)', 'f(x,y) = sin(x^2-y^2)', 'f(x,y) = -xye^{-2(x^2+y^2)}'};

for k = 1:4
    Z = functions{k};
    figure('Name', titles{k}, 'NumberTitle', 'off');

    % 子图1: surf() 三维曲面图
    subplot(2,3,1);
    surf(X, Y, Z);
    title('surf() 曲面');
    xlabel('x'); ylabel('y'); zlabel('z');
    shading interp; % 平滑着色

    % 子图2: surfc() 带等高线的曲面图
    subplot(2,3,2);
    surfc(X, Y, Z);
    title('surfc() 带等高线');
    xlabel('x'); ylabel('y'); zlabel('z');

    % 子图3: mesh() 网格图
    subplot(2,3,3);
    mesh(X, Y, Z);
    title('mesh() 网格');
    xlabel('x'); ylabel('y'); zlabel('z');

    % 子图4: 等高线图
    subplot(2,3,4);
    contourf(X, Y, Z, 20); % 填充等高线，20个层级
    colorbar;
    title('等高线图');
    xlabel('x'); ylabel('y');
    axis square;

    % 子图5: 三视图模拟 - 俯视图 (Top View)
    subplot(2,3,5);
    surf(X, Y, Z);
    view(0, 90); % 俯视：方位角0度，仰角90度
    shading interp;
    title('俯视图');
    xlabel('x'); ylabel('y');
    colorbar;

    % 子图6: 三视图模拟 - 主视图 (Front View)
    subplot(2,3,6);
    surf(X, Y, Z);
    view(0, 0); % 主视：方位角0度，仰角0度
    shading interp;
    title('主视图');
    xlabel('x'); zlabel('z');
end
