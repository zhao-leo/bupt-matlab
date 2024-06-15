x0=[10;10;10;10;10];%初始参数猜测值
x1=linspace(0,3,5000);%生成x数据点
xdata=[0;0.1;0.3;0.4;0.7;0.9;0.95;1.1;1.3;1.8;2.1;2.6;3.0];%生成x数据点
ydata=[6.3700;6.3888;6.2056;5.8676;4.7256;4.8990;5.0383;5.4941;5.9187;4.5944;1.1440;-11.4326;30.0009];%生成对应的y数据点
%定义函数模型
fun=@(x,xdata)x(1)+x(2)*xdata.^2+x(3)*exp(-5*xdata.^3)+x(4)*cos(-2*xdata)+x(5)*xdata.^4;

[x,resnorm]=lsqcurvefit(fun,x0,xdata,ydata);

%打印出拟合的参数
disp(['拟合的参数:a1=',num2str(x(1)),',a2=',num2str(x(2)),',a3=',num2str(x(3)),',a4=',num2str(x(4)),',a5=',num2str(x(5))]);

%绘制图形
plot(x1,fun(x,x1),'r-',xdata,ydata,'b--');

%添加图例和标题
legend('拟合曲线','原始数据');
title('使用lsqcurvefit拟合的曲线');
xlabel('x');
ylabel('y');