function X = gen_decode(P,Nb,l,u)
% ������������P����ΪȺ��X��״̬����
Np = size(P,1); %Ⱥ���С
N = length(Nb); %����ά��
for n = 1:Np
    b2 = 0;
    for m = 1:N
        b1 = b2 + 1;
        b2 = b1 + Nb(m) - 1;
        X(n,m) = bin2dec(P(n,b1:b2))*(u(m) - l(m))/(2^Nb(m) - 1) + l(m); %���뷽��
    end
end