% 定义x和y的网格点
[x_grid, y_grid] = meshgrid(0:2:8, 0:2:8);

% 温度矩阵（索引从1开始，与x_grid和y_grid匹配）
T = [
  100.00,90.00,80.00,70.00,60.00;
  85.00,64.49,53.50,48.15,50.00;
  70.00,48.90,38.43,35.03,40.00;
  55.00,38.78,30.39,27.07,30.00;
  40.00,35.00,30.00,25.00,20.00
  ];

% 创建一个更精细的网格用于绘图
[xq, yq] = meshgrid(0:0.01:8, 0:0.01:8);

% 使用线性插值估计温度
Tq_spline = interp2(x_grid, y_grid, T, xq, yq,"spline");

% 估计特定点的温度
point_a_x = 4;
point_a_y = 3.2;
point_b_x = 4.3;
point_b_y = 2.7;

% 使用interp2函数估计温度
temp_a = interp2(x_grid, y_grid, T, point_a_x, point_a_y, 'spline');
temp_b = interp2(x_grid, y_grid, T, point_b_x, point_b_y, 'spline');

% 显示估计的温度
fprintf('点(a)x=4, y=3.2 的温度估计为：%.2f°C\n', temp_a);
fprintf('点(b)x=4.3, y=2.7 的温度估计为：%.2f°C\n', temp_b);

% 绘制二维彩色网格图
pcolor(xq, yq, Tq_spline);  % 使用pcolor绘制二维彩色网格图
shading interp;  % 平滑颜色过渡

% 设置颜色映射
colormap('jet');

% 添加颜色条
colorbar;

% 添加坐标轴标签和标题
xlabel('X坐标');
ylabel('Y坐标');
title('温度分布二维图像');

% 可以在图上添加估计点的标记
hold on;
plot(point_a_x, point_a_y, 'r*-'); % 点（a）红色
plot(point_b_x, point_b_y, 'b*-'); % 点（b）绿色
hold off;