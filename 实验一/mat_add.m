function A = mat_add(varargin)
    % 检查输入参数是否为空
    if nargin == 0
        A = [];
        return;
    end
    
    % 将第一个输入矩阵赋值给结果 A
    A = varargin{1};
    
    % 循环将后续输入的所有矩阵累加（要求所有输入矩阵维度相同）
    for i = 2:nargin
        A = A + varargin{i};
    end
end