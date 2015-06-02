function [xo,fo] = Nelder0(f,abc,fabc,TolX,TolFun,k)
%��ά�ռ��еĶ���αƽ�
if nargin < 6
    k = 100;
end
if nargin < 5
    TolFun = 1e-8;
end
if nargin < 4
    TolX = 1e-5;
end

%%%%ȷ����������a��b��c�����亯��ֵ����С��������
[fabc,I] = sort(fabc); %����ά�ռ��еĶ������������ĺ���ֵ����С����˳������
a = abc(I(1),:);
b = abc(I(2),:); 
c = abc(I(3),:);
fa = fabc(1); 
fb = fabc(2);
fc = fabc(3);
%%%�ж���������㺯��ֵ�ľ����Ƿ�С�ڸ�����ֵ.��С����ֵֹͣѭ���������Ž�x0=a
fba = fb - fa;  %a,b�㺯��ֵ֮��
fcb = fc - fb;  %b��c�㺯��ֵ֮��
if k <= 0 | abs(fba) + abs(fcb) < TolFun | abs(b - a) + abs(c - b) < TolX
    xo = a;
    fo = fa; %С����ֵ
else   %������ֵ�����¶���ζ���
    m = (a + b)/2; 
    e = 3*m - 2*c; %��չ��expansion��
    fe = feval(f,e);
    if fe < fb
        c = e; 
        fc = fe;
    else
        r = (m+e)/2;  %���䣨reflection��
        fr = feval(f,r);
        if fr < fc
            c = r;
            fc = fr; 
        end
        if fr >= fb
            s = (c + m)/2; %��������inside contraction��
            fs = feval(f,s);
            if fs < fc
                c = s;
                fc = fs;
            else
                b = m;
                c = (a + c)/2; %��С��shrink��
                fb = feval(f,b);
                fc = feval(f,c);
            end
        end
    end
    [xo,fo] = Nelder0(f,[a;b;c],[fa fb fc],TolX,TolFun,k - 1);
end
