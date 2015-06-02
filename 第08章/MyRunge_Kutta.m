function [x,y] = MyRunge_Kutta(fun,x0,xt,y0,PointNum,varargin)
%Runge-Kutta ������΢�ַ�����Ϊ y��(t) = f(x,y(x))
%�˳���ɽ�߽׵�΢�ַ��̡�ֻҪ������ʽдΪ����΢�ַ��̵�������ʽ
% x��ΧΪ[x0,xt],��ֵΪ y0, PointNumΪ��ɢ����,vararginΪ��ѡ������ɴ��ʵ�����������f(x,y)
if nargin < 4 | PointNum <= 0
    PointNum= 100; 
end
if nargin < 3
    y0 = 0; 
end
y(1,:) = y0(:)'; %��ֵ��Ϊ��������ʽ
h = (xt-x0)/(PointNum-1); %���㲽��
x = x0+[0:PointNum]'*h; %��x����ֵ
for k = 1:PointNum  %��������
f1 = h*feval(fun,x(k),y(k,:),varargin{:}); 
f1 = f1(:)'; %�ù�ʽ��k1
f2 = h*feval(fun,x(k) + h/2,y(k,:) + f1/2,varargin{:}); 
f2 = f2(:)'; %�ù�ʽ��k2
f3 = h*feval(fun,x(k) + h/2,y(k,:) + f2/2,varargin{:}); 
f3 = f3(:)'; %�ù�ʽ��k3
f4 = h*feval(fun,x(k) + h,y(k,:) + f3,varargin{:}); 
f4 = f4(:)'; %�ù�ʽ��k4
y(k + 1,:) = y(k,:) + (f1 + 2*(f2 + f3) + f4)/6; %��y(n+1)
end