%ex0810.m 求差分方程的解
A=[1,-0.7,-0.6,1];
B=[1,0.5];
n=[-9:9];
x=[zeros(1,5),ones(1,8),zeros(1,6)];
y=filter(B,A,x)
subplot(211)
stem(n,x);
title('输入响应')
subplot(212)
stem(n,y)
title('输出响应')
