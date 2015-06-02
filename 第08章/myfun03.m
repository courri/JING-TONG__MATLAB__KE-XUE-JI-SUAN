function dy=myfun03(x,y)
dy=zeros(3,1) %初始化变量dy
dy(1)=y(2); %dy(1)表示y的一阶导数,其等于y的第二列值
dy(2)=y(3); %dy(2)表示y的二阶导数
dy(3)=2*y(3)/x^3+3*y(2)/x^3+3*exp(2*x)/x^3 %dy(3)表示y的三阶导数