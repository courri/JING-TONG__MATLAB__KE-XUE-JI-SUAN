function [xo,fo]=Opt_Golden(f,a,b,TolX,TolFun,k)
%%%%�ƽ������㷨��������[a,b]�ϵ����Ż���
%fΪĿ�꺯����TolXΪx��ֵ��TolFunΪ������ֵ��kΪ��������
r =(sqrt(5)-1)/2; %rΪ�ƽ�ָ��ֵ��
h = b-a;  %������
rh = r*h; 
%%%ȡ����c��d,��������Ӧ�ĺ���ֵfc��fd
c = b-rh; 
d = a+rh;
fc = feval(f,c);
fd = feval(f,d);
%%%�㷨�ڶ����ж��Ƿ�ֹͣ����
if k <= 0 | (abs(h) < TolX & abs(fc - fd) < TolFun)
    if fc <= fd
        xo = c;
        fo = fc;
    else
        xo = d;
        fo = fd;
    end
    if k == 0
        fprintf('����趨������������0');
    end
%%%%�㷨��������������һ�ֵ���    
else
    if fc < fd
        [xo,fo] = Opt_Golden(f,a,d,TolX,TolFun,k-1);
    else
        [xo,fo] = Opt_Golden(f,c,b,TolX,TolFun,k-1);
    end
end