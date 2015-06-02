function [Xout,Yout]=MyEulerPro(fun,x0,xt,y0,PointNumber)
%MyEulerPro �øĽ���ŷ������΢�ַ���
if nargin<5 | PointNumber<=0 %�������������4������ֵ����PointNumerĬ��ֵΪ100
    PointNumer=100;
end
if nargin<4 %y0Ĭ��ֵΪ0
    y0=0;
end
h=(xt-x0)/PointNumber;%������ȡ������ɢ��֮��ľ���
x=x0+[0:PointNumber]'*h;%��ʾ����ɢ���Ա���x
y(1,:)=y0(:)';
for i=1:PointNumber    %�����������
    f1=h*feval(fun,x(i),y(i,:));
    f1=f1(:)';
    f2=h*feval(fun,x(i+1),y(i,:)+f1);
    f2=f2(:)';
    y(i+1,:)=y(i,:)+1/2*(f1+f2);
end
Xout=x;
Yout=y;