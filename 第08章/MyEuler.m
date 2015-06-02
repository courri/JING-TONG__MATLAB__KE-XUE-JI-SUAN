function [outx,outy]=MyEuler(fun,x0,xt,y0,PointNum)
%MyEuler ��ǰ���ֵ�ŷ��������΢�ַ���
%fun ��ʾf��x��y��
%x0,xt��ʾ�Ա����ĳ�ֵ����ֵ
%y0��ʾ������x0����ֵ,�����Ϊ������ʽ
%PointNum��ʾ�Ա�����[x0,xt]��ȡ�ĵ���
if nargin<5 | PointNum<=0 %�������������4������ֵ����PointNumĬ��ֵΪ100
    PointNum=100;
end
if nargin<4 %y0Ĭ��ֵΪ0
    y0=0;
end
h=(xt-x0)/PointNum;%���㲽��h
x=x0+[0:PointNum]'*h;%�Ա�������
y(1,:) = y0(:)';%�������Ϊ������������Ϊ��������ʽ
for k = 1:PointNum
    f=feval(fun,x(k),y(k,:));%����f(x,y)��ÿ���������ֵ
    f=f(:)';
    y(k + 1,:) =y(k,:) +h*f; %������ȡ�ĵ�x��������yֵ
end
outy=y;
outx=x;
%plot(x,y)%�������̽�ĺ���ͼ
