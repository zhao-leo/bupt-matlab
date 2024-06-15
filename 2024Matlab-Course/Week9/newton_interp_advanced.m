function [y,D]=newton_interp_advanced(xdata,ydata,x)
% Newton 插值
% 输入参数：
% ---xdata：给定的节点横坐标
% ---ydata：给定的节点纵坐标
% ---x：需要进行插值的节点横坐标
% 输出参数：
% ---y：Newton 插值函数在 x 处的函数值
% ---D：差商表

n = length(xdata);
if n ~= length(ydata)
    error('插值数据长度不等！');
end

for i = 1:n-1
    if abs(xdata(i+1) - xdata(i)) < eps
        error('输入的 n+1 个节点不是互异的。');
    end
end

D = ydata;
H = 1;
L = zeros(n-1, length(x)); % 预先分配 L 的大小
for j = 1:n-1
    for k = n:-1:j+1
        D(k) = (D(k) - D(k-1)) / (xdata(k) - xdata(k-j));
    end
    H = H .* (x - xdata(j));
    L(j,:) = H;
end
L=[ones(size(x));L];
y=L.*repmat(D(1,:)',1,length(x));
y=sum(y);