% --- 1. 数值方法计算 (使用双精度 double 运算) ---
m_num = 50; 
n_num = 10;
C_num = factorial(m_num) / (factorial(n_num) * factorial(m_num - n_num));

% --- 2. 符号运算方法计算 (保持绝对精确) ---
syms m_sym n_sym;
m_sym = sym(50); 
n_sym = sym(10);
C_sym = factorial(m_sym) / (factorial(n_sym) * factorial(m_sym - n_sym));

% --- 3. 结果比较 ---
fprintf('数值方法结果 (双精度会有误差): %f\n', C_num);
disp('符号运算方法结果 (完全精确无损):');
disp(C_sym);