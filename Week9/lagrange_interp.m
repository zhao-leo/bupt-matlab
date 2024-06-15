function y=lagrange_interp(xdata,ydata,x)
% Lagrange 插值
% 输入参数：
% ---xdata：给定的节点横坐标
% ---ydata：给定的节点纵坐标
% ---x：需要进行插值的节点横坐标
% 输出参数：
% ---y：Lagrange 插值函数在 x 处的函数值
% = 
n=length(xdata);
m=length(ydata);
if n~=m
error('插值数据长度不等！');
end
ii=1:n;
y=zeros(size(x));
for i=ii
ij=find(ii~=i);V=1;
% if sum(abs(xdata(i)-xdata(ij))<eps)>0
% error()
% end
for j=1:length(ij)
if abs(xdata(i)-xdata(ij(j)))<eps
error('输入的 n+1 个节点不是互异的。');
end
V=V.*(x-xdata(ij(j)));
end
%prod(x-xdata(ij)')
y=y+V*ydata(i)/prod(xdata(i)-xdata(ij));
end