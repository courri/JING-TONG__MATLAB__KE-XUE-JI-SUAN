function ex0102()
x=0.1:pi/15:2*pi
y1=exp(x);
y2=log(x);
y3=sin(x);
y4=cos(x);

subplot(2,2,1);%拆分成2*2个区域，在第一个区域作图
plot(x,y1);
title('exp(x)');
subplot(2,2,2);%在第2个区域作图
plot(x,y2);
title('ln(x)');
subplot(2,2,3);%在第3个区域作图
plot(x,y3);
title('sin(x)');
subplot(2,2,4);%在第4个区域作图
plot(x,y4);
title('cos(x)');
[a,b,butkey]=ginput;%显示十字光标，来定位点的坐标
a
b

% 运行结束之后，可以尝试:
% 修改plot(x,y1);为spy;
% 以及修改plot(x,y4);为earthmap;
% 看看效果，以后在学习完一段正确的代码之后，
% 都需要争取自己天马行空修改代码，
% 这样学习一门程序设计语言才是最高效最欢乐的哦




