function [xo,fo] = genetic(f,x0,l,u,Np,Nb,Pc,Pm,eta,kmax)
% �����㷨��f(x����Сֵ s.t. l <= x <= u
%fΪ������,x0��ֵ��l��u�����ޣ�NpȺ���С��Nbÿһ�������Ļ���ֵ������������
%Pc������ʣ�Pm������ʣ�etaѧϰ�ʣ�kmax����������
N = length(x0);
%%%%%ȷ��������ȱʡֵ
if nargin < 10
    kmax = 100; %����������ȱʡΪ100
end
if nargin < 9|eta > 1|eta <= 0
    eta = 1;  %ѧϰ��eta,(0 < eta < 1)
end
if nargin < 8
    Pm = 0.01; %�������ȱʡ0.01
end
if nargin < 7
    Pc = 0.5; %�������ȱʡ0.5
end
if nargin < 6
    Nb = 8*ones(1,N);%ÿһ�����Ļ���ֵ������������
end
if nargin < 5
    Np = 10; %Ⱥ���С��Ⱦɫ������
end
%%%%%���ɳ�ʼȺ��
NNb = sum(Nb);
xo = x0(:)'; l = l(:)'; u = u(:)';
fo = feval(f,xo);
X(1,:) = xo;
for n = 2:Np
    X(n,:) = l + rand(size(x0)).*(u - l); %��ʼȺ���������
end
P = gen_encode(X,Nb,l,u);  %����Ϊ2�����ִ�
for k = 1:kmax
    X = gen_decode(P,Nb,l,u);  %����Ϊ10������
    for n = 1:Np
        fX(n) = feval(f,X(n,:));
    end
    [fxb,nb] = min(fX);   %ѡ�����ʺϵģ�����ֵ��С��
    if fxb < fo
        fo = fxb;
        xo = X(nb,:);
    end
    fX1 = max(fxb) - fX; %������ֵת��Ϊ�Ǹ����ʺ϶�ֵ
    fXm = fX1(nb);
    if fXm < eps  %������е�Ⱦɫ��ֵ��ͬ����ֹ����
        return;
    end
    %%%%%������һ��
    for n = 1:Np
        X(n,:) = X(n,:) + eta*(fXm - fX1(n))/fXm*(X(nb,:) - X(n,:));%����׼��
    end
    P = gen_encode(X,Nb,l,u); %����һ��Ⱦɫ�����
    %%%%%%������/������µ�Ⱦɫ������
    is = shuffle([1:Np]);
    for n = 1:2:Np - 1
        if rand < Pc
            P(is(n:n + 1),:) = crossover(P(is(n:n + 1),:),Nb);
        end
    end
    %%%%%%����
    P = mutation(P,Nb,Pm);
end