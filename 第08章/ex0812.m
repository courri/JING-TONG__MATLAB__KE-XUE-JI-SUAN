%ex0812.m 利用z变换求脉冲响应
syms z
hz=1/(1-z^(-1));
hn=iztrans(hz)
