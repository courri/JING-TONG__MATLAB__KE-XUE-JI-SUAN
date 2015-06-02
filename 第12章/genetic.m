function [xo,fo] = genetic(f,x0,l,u,Np,Nb,Pc,Pm,eta,kmax)
% 基因算法求f(x）最小值 s.t. l <= x <= u
%f为待求函数,x0初值，l，u上下限，Np群体大小，Nb每一个变量的基因值（二进制数）
%Pc交叉概率，Pm变异概率，eta学习率，kmax最大迭代次数
N = length(x0);
%%%%%确定各变量缺省值
if nargin < 10
    kmax = 100; %最大迭代次数缺省为100
end
if nargin < 9|eta > 1|eta <= 0
    eta = 1;  %学习率eta,(0 < eta < 1)
end
if nargin < 8
    Pm = 0.01; %变异概率缺省0.01
end
if nargin < 7
    Pc = 0.5; %交叉概率缺省0.5
end
if nargin < 6
    Nb = 8*ones(1,N);%每一变量的基因值（二进制数）
end
if nargin < 5
    Np = 10; %群体大小（染色体数）
end
%%%%%生成初始群体
NNb = sum(Nb);
xo = x0(:)'; l = l(:)'; u = u(:)';
fo = feval(f,xo);
X(1,:) = xo;
for n = 2:Np
    X(n,:) = l + rand(size(x0)).*(u - l); %初始群体随机数组
end
P = gen_encode(X,Nb,l,u);  %编码为2进制字串
for k = 1:kmax
    X = gen_decode(P,Nb,l,u);  %解码为10进制数
    for n = 1:Np
        fX(n) = feval(f,X(n,:));
    end
    [fxb,nb] = min(fX);   %选择最适合的，函数值最小的
    if fxb < fo
        fo = fxb;
        xo = X(nb,:);
    end
    fX1 = max(fxb) - fX; %将函数值转化为非负的适合度值
    fXm = fX1(nb);
    if fXm < eps  %如果所有的染色体值相同，终止程序
        return;
    end
    %%%%%复制下一代
    for n = 1:Np
        X(n,:) = X(n,:) + eta*(fXm - fX1(n))/fXm*(X(nb,:) - X(n,:));%复制准则
    end
    P = gen_encode(X,Nb,l,u); %对下一代染色体编码
    %%%%%%随机配对/交叉得新的染色体数组
    is = shuffle([1:Np]);
    for n = 1:2:Np - 1
        if rand < Pc
            P(is(n:n + 1),:) = crossover(P(is(n:n + 1),:),Nb);
        end
    end
    %%%%%%变异
    P = mutation(P,Nb,Pm);
end