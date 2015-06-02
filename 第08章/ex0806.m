%ex0806.m ��ode113(),MyHamming(),��΢�ַ���y'=-y+1
clear, clf
x0 = 0; %��������ʼֵ
xt = 10; %����������ֵֹ
y0 = 0; %y��ֵ
N = 50; %��ɢ����
fun66 = inline('-y+1','x','y'); %��Ҫ����΢�ַ���
f66 = inline('1-exp(-t)','t'); %���̵ľ�ȷ������
tic
[x113,y113] = ode113(fun66,[x0,xt],y0); 
t113 = toc
tic
[x1,yH] = MyHamming(fun66,x0,xt,y0,N); 
tH = toc
yt1 = f66(x1); %�ھ�ȷ����ȡ��ɢ��
subplot(1,2,1) %�����ڷ�Ϊһ�����У��ڵ�һ��ͼ���������ַ����Ľ������
plot(x1,yt1,'*r',x1,yH,'og')
legend('��ȷ��','Hamming��')
title('Hamming�����õĽ�')
yt113=f66(x113);
subplot(122 ) 
plot(x113,yt113,'*r', x113, y113,'og')
legend('��ȷ��','ABM��')
title('ode113��ABM�㷨���õĽ�')
