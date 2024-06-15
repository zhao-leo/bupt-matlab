x0=[10;10;10;10];%初始参数猜测值
xdata=linspace(0,1.5,5000);%生成x数据点
ydata=xdata.*exp(xdata);%生成对应的y数据点
%定义函数模型
fun=@(x,xdata)x(1)*xdata.^3+x(2)*xdata.^2+x(3)*xdata+x(4);

[x,resnorm]=lsqcurvefit(fun,x0,xdata,ydata);

%打印出拟合的参数
disp(['拟合的参数:a=',num2str(x(1)),',b=',num2str(x(2)),',c=',num2str(x(3)),',d=',num2str(x(4))]);
disp(['拟合的方程:',num2str(x(1)),'*x^3+',num2str(x(2)),'*x^2+',num2str(x(3)),'*x+',num2str(x(4))]);

%绘制图形
plot(xdata,fun(x,xdata),'r-',xdata,ydata,'b--');

%添加图例和标题
legend('拟合曲线','原始数据');
title('使用lsqcurvefit拟合的曲线');
xlabel('x');
ylabel('y');