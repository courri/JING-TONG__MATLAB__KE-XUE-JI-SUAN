%ex1215.m 求解最大利润问题
x0=[0,0];
[xo_s,yo_s]=fminsearch('f1215',x0)
[xo_m,yo_m]=fminunc('f1215',x0)
