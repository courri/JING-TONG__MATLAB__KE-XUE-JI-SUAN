%%%ex1208.m �������ճ��ӷ������Ż���
x=zeros(1,2);
%��syms��ʾ��ת�������Լ������
syms x y lama
f=x+y+lama*(x^2+y^2-2);
%�ֱ���������x��y��lama��ƫ��
dx=diff(f,x);
dy=diff(f,y);
dlama=diff(f,lama);
%��ƫ��Ϊ�����x��y
xx=solve(dx,x); %��x��ʾΪlama����
yy=solve(dy,y);  %��y��ʾΪlama����
ff=subs(dlama,{x,y},{xx,yy}); %����dlama�ù���lama��һԪ����
lamao=solve(ff); %����lamao
xo=subs(xx,lama,lamao) %���ȡ��ֵ����xo
yo=subs(yy,lama,lamao)  %ȡ��ֵ����yo
fo=subs(f,{x,y,lama},{xo,yo,lamao}) %��ֵ�㺯��ֵ