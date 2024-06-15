function XY=Henon(x0,y0,N)
% Henon引力线
% 输入参数：
%
%---x0：迭代初始值-x0
%---y0：迭代初始值-y0
%---N：迭代次数
% 输出参数：
%
%---XY：Henon引力线的点坐标
x=x0;
y=y0;
% 初始化存储结果的矩阵，第一行存储初始值
XY = [x0, y0];

% 迭代模型
for k = 1:N
    % 更新x和y的值
    x_new = 1 + y - 1.4 * x^2;
    y_new = 0.3 * x;
    
    % 将新的x和y值添加到矩阵的下一行
    XY = [XY; x_new, y_new];
    x=x_new;
    y=y_new;
end

% 绘制Henon引力线图
figure;
plot(XY(:,1), XY(:,2), '.'); % 绘制点，不连线
title('Henon引力线图');