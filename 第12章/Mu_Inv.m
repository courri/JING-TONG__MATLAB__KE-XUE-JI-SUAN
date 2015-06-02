%模拟退火法中的mu^（-1）定理
function x = Mu_Inv(y,mu) 
x = (((1+mu).^abs(y)- 1)/mu).*sign(y);