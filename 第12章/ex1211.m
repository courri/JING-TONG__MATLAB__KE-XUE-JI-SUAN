%ex1211.m 用lsqnonlin求解最小二乘问题
clear all
x0 = [0.3 0.4];                        % 初值点
[x,resnorm] = lsqnonlin(@f1211,x0)    % 调用最优化函数求得x与平方和残差