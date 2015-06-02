function [xo,fo] = Opt_Steepest(f,grad,x0,TolX,TolFun,dist0,MaxIter)
% �������½��������Ż���
%���룺fΪ������ gradΪ�ݶȺ���
%x0Ϊ��ĳ�ֵ TolX,TolFun�ֱ�Ϊ�����ͺ����������ֵ
%dist0Ϊ��ʼ���� MaxIterΪ����������
%���: xoΪȡ��Сֵ�ĵ� foΪ��С�ĺ���ֵ
% f0 = f(x(0))

%%%%%%�ж�����ı��������趨һЩ����ΪĬ��ֵ
if nargin < 7
    MaxIter = 100; %����������Ĭ��Ϊ100
end
if nargin < 6
    dist0 = 10; %��ʼ����Ĭ��Ϊ10
end
if nargin < 5
    TolFun = 1e-8; %����ֵ���Ϊ1e-8
end
if nargin < 4
    TolX = 1e-6; %�Ա����������
end
%%%%%��һ�������ĳ�ֵ�ĺ���ֵ
x = x0;
fx0 = feval(f,x0);
fx = fx0;
dist = dist0;
kmax1 = 25; %����������ȷ�������������������
warning = 0; 
%%%%%�������������Ž�

for k = 1: MaxIter
    g = feval(grad,x);
    g = g/norm(g); %����x�����ݶȷ���
    %%������������ȷ������
    dist = dist*2; %���Ϊԭ�����Ķ���
    fx1 = feval(f,x-dist*2*g);
    for k1 = 1:kmax1
        fx2 = fx1;
        fx1 = feval(f,x-dist*g);
        if fx0 > fx1+TolFun & fx1 < fx2 - TolFun %fx0 > fx1 < fx2��
            den = 4*fx1 - 2*fx0 - 2*fx2;num = den - fx0 + fx2;  %���αƽ���
            dist = dist*num/den;
            x = x - dist*g; fx = feval(f,x); %ȷ����һ��
            break;
        else
            dist = dist/2;
        end
    end
    if k1 >= kmax1
        warning = warning + 1; %�޷�ȷ�����Ų���
    else
        warning = 0;
    end
    if warning >= 2|(norm(x - x0) < TolX&abs(fx - fx0) < TolFun)
        break;
    end
    x0 = x;
    fx0 = fx;
end
xo = x; fo = fx;
if k == MaxIter
    fprintf('Just best in %d iterations',MaxIter);
end