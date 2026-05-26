%% 自动生成四阶微分方程Simulink仿真模型
% 方程：y^(4) + 5y''' + 63y'' + 4y' + 2y = exp(-3t) + exp(-5t)sin(4t + pi/3)
% 初始条件：y(0)=1, y'(0)=0.5, y''(0)=0.5, y'''(0)=0.2

%% 步骤1：创建新模型
model = 'FourOrderODE_Simulation';
new_system(model);
open_system(model);

%% 步骤2：添加两个Clock和两个Fcn模块
add_block('simulink/Sources/Clock', [model '/Clock1']);
add_block('simulink/Sources/Clock', [model '/Clock2']);
set_param([model '/Clock2'], 'Position', [100, 130, 130, 160]);

add_block('simulink/User-Defined Functions/Fcn', [model '/Fcn']);
set_param([model '/Fcn'], 'Expression', 'exp(-3*u)', 'Position', [250, 70, 350, 100]);

add_block('simulink/User-Defined Functions/Fcn', [model '/Fcn1']);
set_param([model '/Fcn1'], 'Expression', 'exp(-5*u)*sin(4*u+pi/3)', 'Position', [250, 150, 400, 180]);

%% 步骤3：添加第一个Sum（两输入加法器）
add_block('simulink/Math Operations/Sum', [model '/Sum1']);
set_param([model '/Sum1'], 'Inputs', '++', 'Position', [500, 90, 530, 160]);

%% 步骤4：添加主Sum（五输入加法器）
add_block('simulink/Math Operations/Sum', [model '/Sum']);
set_param([model '/Sum'], 'Inputs', '+++++', 'Position', [700, 100, 730, 220]);

%% 步骤5：添加四个Integrator并设置初始值（串联）
% 顺序：Integrator(输出y''') -> Integrator1(输出y'') -> Integrator2(输出y') -> Integrator3(输出y)
integratorNames = {'Integrator', 'Integrator1', 'Integrator2', 'Integrator3'};
initialConditions = [0.2, 0.5, 0.5, 1]; % y'''(0)=0.2, y''(0)=0.5, y'(0)=0.5, y(0)=1
startX = 800;
spacing = 200;

for i = 1:4
    blockPath = [model '/' integratorNames{i}];
    add_block('simulink/Continuous/Integrator', blockPath);
    set_param(blockPath, 'InitialCondition', num2str(initialConditions(i)), ...
        'Position', [startX + (i-1)*spacing, 115, startX + (i-1)*spacing+60, 145]);
end

%% 步骤6：添加四个Gain模块（负反馈）
gainNames = {'Gain', 'Gain1', 'Gain2', 'Gain3'};
gainValues = [-2, -4, -63, -5]; % 对应方程系数2, 4, 63, 5
feedbackStartX = 1000;
feedbackY = 250;

for i = 1:4
    blockPath = [model '/' gainNames{i}];
    add_block('simulink/Math Operations/Gain', blockPath);
    set_param(blockPath, 'Gain', num2str(gainValues(i)), ...
        'Position', [feedbackStartX + (i-1)*150, feedbackY, feedbackStartX + (i-1)*150+30, feedbackY+40]);
end

%% 步骤7：完成所有连接（按图连接）
% 连接时钟到Fcn
add_line(model, 'Clock1/1', 'Fcn/1');
add_line(model, 'Clock2/1', 'Fcn1/1');

% 连接Fcn输出到Sum1
add_line(model, 'Fcn/1', 'Sum1/1');
add_line(model, 'Fcn1/1', 'Sum1/2');

% 连接Sum1输出(u(t))到主Sum的第1个输入端
add_line(model, 'Sum1/1', 'Sum/1');

% 连接四个Integrator（串联）
add_line(model, 'Sum/1', 'Integrator/1'); % 主Sum输出到第一个Integrator
for i = 1:3
    add_line(model, [integratorNames{i} '/1'], [integratorNames{i+1} '/1']);
end

% 连接四个Gain模块的负反馈
% 注意：根据图片，Gain模块的输出连接到主Sum的第2至第5个输入端
% Integrator输出y'''连接到Gain3(-5)
add_line(model, 'Integrator/1', 'Gain3/1');
add_line(model, 'Gain3/1', 'Sum/2');

% Integrator1输出y''连接到Gain2(-63)
add_line(model, 'Integrator1/1', 'Gain2/1');
add_line(model, 'Gain2/1', 'Sum/3');

% Integrator2输出y'连接到Gain1(-4)
add_line(model, 'Integrator2/1', 'Gain1/1');
add_line(model, 'Gain1/1', 'Sum/4');

% Integrator3输出y连接到Gain(-2)
add_line(model, 'Integrator3/1', 'Gain/1');
add_line(model, 'Gain/1', 'Sum/5');

%% 步骤8：添加Scope
add_block('simulink/Sinks/Scope', [model '/Scope']);
add_line(model, 'Integrator3/1', 'Scope/1');

%% 步骤9：设置仿真参数
set_param(model, 'Solver', 'ode45', ...
    'StopTime', '100', ...
    'MaxStep', '0.1');

%% 步骤10：运行仿真
fprintf('开始运行仿真...\n');
sim(model);

%% 步骤11：查看结果（自动打开Scope）
fprintf('仿真完成。Scope窗口已自动显示结果。\n');
% 打开Scope查看y(t)波形
open_system([model '/Scope']);
