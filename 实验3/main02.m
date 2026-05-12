%% 题2：求解齐次线性方程组的基础解系
% 题目：求解以下齐次线性方程组的基础解系
%
% 6x1 + x2 + 4x3 - 7x4 - 3x5 = 0
% -2x1 - 7x2 - 8x3 + 6x4 = 0
% -4x1 + 5x2 + x3 - 6x4 + 8x5 = 0
% -34x1 + 36x2 + 9x3 - 21x4 + 49x5 = 0
% -26x1 - 12x2 - 27x3 + 27x4 + 17x5 = 0

clear; clc;

fprintf('================== 题2：求解齐次线性方程组的基础解系 ==================\n\n');

%% 1. 系数矩阵
A = [6   1   4  -7  -3;
    -2  -7  -8   6   0;
    -4   5   1  -6   8;
   -34  36   9 -21  49;
   -26 -12 -27  27  17];

fprintf('系数矩阵A:\n');
disp(A);

[m, n] = size(A);
fprintf('\n方程组有 %d 个方程，%d 个未知数\n', m, n);

%% 2. 求解方法1：使用null函数
fprintf('\n===== 方法1：使用 null 函数 =====\n');

% null(A) - 正交基形式
Z_orth = null(A);
fprintf('null(A) - 正交基:\n');
disp(Z_orth);

% null(A, 'r') - 有理数形式（推荐）
Z_rational = null(A, 'r');
fprintf('\nnull(A, ''r'') - 有理数基:\n');
disp(Z_rational);

%% 3. 分析解空间
rank_A = rank(A);
dim_null = n - rank_A;

fprintf('\n===== 解空间分析 =====\n');
fprintf('矩阵A的秩: rank(A) = %d\n', rank_A);
fprintf('解空间维数: dim(Null(A)) = n - rank(A) = %d - %d = %d\n', n, rank_A, dim_null);

if dim_null == 0
    fprintf('\n注意：矩阵A是列满秩的，基础解系仅包含零向量（只有零解）。\n');
    fprintf('这意味着方程组只有唯一解：X = 0\n');
else
    fprintf('\n基础解系包含 %d 个线性无关的向量\n', dim_null);
end

%% 4. 求解方法2：行阶梯形式
fprintf('\n===== 方法2：行阶梯形式分析 =====\n');

[R, jb] = rref(A);
fprintf('简化行阶梯形式 R:\n');
disp(R);

fprintf('\n主元列索引 jb = [%d', jb(1));
for i = 2:length(jb)
    fprintf(', %d', jb(i));
end
fprintf(']\n');

fprintf('\n主元列对应的变量为约束变量\n');
fprintf('非主元列对应的变量为自由变量\n');

%% 5. 列出基础解系
fprintf('\n===== 基础解系 =====\n');

if ~isempty(Z_rational)
    for i = 1:size(Z_rational, 2)
        fprintf('\n第 %d 个基础解系向量 ξ%d:\n', i, i);
        fprintf('ξ%d = [', i);
        for j = 1:n
            fprintf(' %.4f', Z_rational(j, i));
        end
        fprintf(' ]''\n');
    end
    
    % 简化的整数形式
    fprintf('\n简化形式（乘以适当常数）:\n');
    for i = 1:size(Z_rational, 2)
        % 找到第一个非零元素并归一化
        vec = Z_rational(:, i);
        first_nonzero = find(abs(vec) > 1e-10, 1);
        if ~isempty(first_nonzero)
            scale = vec(first_nonzero);
            vec_normalized = vec / scale;
            fprintf('ξ%d = [', i);
            for j = 1:n
                if abs(vec_normalized(j)) < 1e-10
                    fprintf(' 0');
                elseif abs(vec_normalized(j) - round(vec_normalized(j))) < 1e-10
                    fprintf(' %d', round(vec_normalized(j)));
                else
                    fprintf(' %.2f', vec_normalized(j));
                end
            end
            fprintf(' ]''\n');
        end
    end
else
    fprintf('基础解系为空，方程组只有零解。\n');
end

%% 6. 验证基础解系
fprintf('\n===== 验证基础解系 =====\n');

if ~isempty(Z_rational)
    fprintf('验证每个基础解系向量是否满足 A*ξ = 0:\n');
    for i = 1:size(Z_rational, 2)
        residual = norm(A * Z_rational(:, i));
        if residual < 1e-10
            status = '✓';
        else
            status = '✗';
        end
        fprintf('  A*ξ%d = 0 ? ||A*ξ%d|| = %.2e %s\n', i, i, residual, status);
    end
end

%% 7. 写出通解
fprintf('\n===== 方程组的通解 =====\n');

if ~isempty(Z_rational) && size(Z_rational, 2) > 0
    fprintf('齐次线性方程组的通解为:\n');
    fprintf('X = ');
    for i = 1:size(Z_rational, 2)
        if i == 1
            fprintf('c%d*ξ%d', i, i);
        else
            fprintf(' + c%d*ξ%d', i, i);
        end
    end
    fprintf('\n\n其中 c1, c2, ..., c%d 为任意常数\n', size(Z_rational, 2));
    
    % 另一种通解表示
    fprintf('\n或者用参数形式:\n');
    fprintf('X = [x1, x2, x3, x4, x5]''\n');
    fprintf('满足: A*X = 0\n');
else
    fprintf('方程组的通解为:\n');
    fprintf('X = [0, 0, 0, 0, 0]''\n');
    fprintf('即只有零解。\n');
end

%% 8. 结果总结
fprintf('\n===== 结果总结 =====\n');
fprintf('系数矩阵秩: %d\n', rank_A);
fprintf('未知数个数: %d\n', n);
fprintf('自由变量个数: %d\n', dim_null);
fprintf('基础解系向量个数: %d\n', size(Z_rational, 2));
