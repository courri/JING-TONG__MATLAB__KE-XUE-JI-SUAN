function p = fem_basis_ftn(N,S)
%p(i,s,1:3): 基函数 ftn phi_i系数
% 共s个子区域
%N(n,1:2) : 第n个节点的x和y坐标
%S(s,1:3) : 第s个子区域的节点#s
N_n = size(N,1); %总共节点数
N_s = size(S,1); % 总子区域个数
for n = 1:N_n
    for s = 1:N_s
        for i = 1:3
            A(i,1:3) = [1 N(S(s,i),1:2)];
            b(i) = (S(s,i) == n); %The nth basis ftn is 1 only at node n.
        end
        pnt=A\b';
        for i=1:3, p(n,s,i) = pnt(i); end
    end
end