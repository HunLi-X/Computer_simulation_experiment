A = [1 2 3; 4 5 6; 7 8 0];
B = [4; 3; 2];
C = [1 2 3];
D = 0;

% 建立状态空间模型
sys_ss = ss(A, B, C, D);

% 转换为传递函数
[num, den] = ss2tf(A, B, C, D);
G = tf(num, den)

% 求零极点
[p, z] = pzmap(G);
disp('极点：'); disp(p);
disp('零点：'); disp(z);
