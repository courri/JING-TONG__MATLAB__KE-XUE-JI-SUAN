function [xo,fo] = Opt_Quadratic(f,x,TolX,TolFun,MaxIter)
% �ö��β�ֵ��f(x)���Ž�
if nargin < 5
    MaxIter =100;
end
if nargin < 4
    TolFun= 1e-8;
end
if nargin < 3
    TolX = 1e-5;
end
%%%��������ȷ������ĳ�ʼֵ���������Ӧ�ĺ���ֵ
if length(x) > 2 
    x012 = x(1:3);
else
    if length(x) == 2
        a = x(1);
        b = x(2);
    else
        a = x-10; b = x+10;
    end
    x012 = [a (a + b)/2 b];
end
f012 = f(x012);
%%%%��ʼ������ֵ
x0 = x012(1);
x1 = x012(2);
x2 = x012(3);
f0 = f012(1);
f1 = f012(2);
f2 = f012(3);
%%%%%�����ֵ����ʽ��ȡ��Сֵ����x3�Լ���Ӧ����Сֵf3
nd = [f0-f2 f1-f0 f2-f1]*[x1*x1 x2*x2 x0*x0; x1 x2 x0]';
x3 = nd(1)/2/nd(2);
f3 = feval(f,x3); 
%%%%�ж��Ƿ�ֹͣ����
if MaxIter<= 0 | abs(x3 - x1) < TolX | abs(f3 - f1) < TolFun
    xo = x3;
    fo = f3;
else
%%%%%��������Ķ���ʽֵ������������ֵ�Ĵ�С�Ƚ�ȷ����Ӧ���µ�����
    if x3 < x1
        if f3 < f1
            x012 = [x0 x3 x1];
            f012 = [f0 f3 f1];
        else
            x012 = [x3 x1 x2];
            f012 = [f3 f1 f2];
        end
    else
        if f3 <= f1
            x012 = [x1 x3 x2];
            f012 = [f1 f3 f2];
        else
            x012 = [x0 x1 x3];
            f012 = [f0 f1 f3];
        end
    end
%%%%%������һ�ֵ���
    [xo,fo] = Opt_Quadratic(f,x012,TolX,TolFun,MaxIter-1);
end