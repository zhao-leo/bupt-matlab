%test1.m
% 定义函数
fun = @(x) sin(x)./x;

% 求积分，例如从 0 到 10，误差容忍度为 1e-6
[I, steps] = simpson(fun, 1, 5, 1e-6);

% 显示结果
fprintf('积分结果为: %f\n', I);

y_values = arrayfun(fun, steps);

% 绘制步长点
plot(steps, y_values, 'o-', 'LineWidth', 2);
title('自适应步长展示');
grid on;

% 增加注释
for i = 1:length(steps)
    text(steps(i), y_values(i), sprintf('(%0.2f, %0.2f)', steps(i), y_values(i)), ...
         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end