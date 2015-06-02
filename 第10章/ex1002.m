function ex1002()
%syms f w u v t F;
%F=-2/(w^2+u^2);
%f=ifourier(F,u,v)
subplot(1,2,1),fplot('-2/(x*x)', [0.1,3]);
title('频谱函数');
hold on;
subplot(1,2,2),fplot('x*(2*heaviside(x)-1)',[-3,3]);
title('傅氏反变换后的时域函数');






