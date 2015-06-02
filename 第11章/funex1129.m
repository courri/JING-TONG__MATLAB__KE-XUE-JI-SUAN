%拟合模型函数
function yhat=funex1129(beta0,x)
a=beta0(1);
b=beta0(2);
yhat=a+(0.49-a)*exp(-b*(x-8));