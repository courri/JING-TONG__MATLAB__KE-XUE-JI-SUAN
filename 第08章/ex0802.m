function ex0802()
%ex0802 �ȽϸĽ�ŷ��������ŷ�������Լ�΢�ַ��̷��Ž�
[x3,y3]=MyEulerPro('myfun01',0,2*pi,1,128);
[x,y1]=MyEuler('myfun01',0,2*pi,1,128);%ŷ�������ĵĽ�
y=dsolve('Dy=y+sin(t)','y(0)=1');%�ó�΢�ַ��̵ķ��Ž�
for k=1:129
t(k)=x(k);
y2(k)=subs(y,t(k));%�����Ӧ�����ɢ��
end
plot(x,y1,'-b',x3,y3,'og',x,y2,'*r')
legend('��ŷ������','�Ľ�ŷ����','���Ž�')




