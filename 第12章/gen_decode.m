function X = gen_decode(P,Nb,l,u)
% 将二进制数组P解码为群体X的状态矩阵
Np = size(P,1); %群体大小
N = length(Nb); %变量维数
for n = 1:Np
    b2 = 0;
    for m = 1:N
        b1 = b2 + 1;
        b2 = b1 + Nb(m) - 1;
        X(n,m) = bin2dec(P(n,b1:b2))*(u(m) - l(m))/(2^Nb(m) - 1) + l(m); %解码方程
    end
end