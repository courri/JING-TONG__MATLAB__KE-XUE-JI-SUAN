function [xo,fo] =Opt_Nelder(f,x0,TolX,TolFun,MaxIter)
%Nelder-Mead�����ڶ�ά���������Ż����⣬ά��>=2.
N = length(x0);
if N == 1 %һά������ö��αƽ�����
    [xo,fo] = Opt_Quadratic(f,x0,TolX,TolFun,MaxIter);
    return
end
S = eye(N);
for i = 1:N  %�Ա���ά������2ʱ���ظ�����ÿ����ƽ������
    i1 = i + 1;
    if i1 > N
        i1 = 1;
    end
    abc = [x0; x0 + S(i,:); x0 + S(i1,:)]; %ÿһ��������ƽ��
    fabc = [feval(f,abc(1,:)); feval(f,abc(2,:)); feval(f,abc(3,:))];
    [x0,fo] = Nelder0(f,abc,fabc,TolX,TolFun,MaxIter);
    if N < 3  %��ά��������ظ�
        break;
    end 
end
xo = x0;