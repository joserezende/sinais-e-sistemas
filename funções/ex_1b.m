%-------------Exercicio 1 (item b)-------------
clear all;
close all;
x=[0 1 -2 4 6 -5 8 10 -7 3];
n=-5:4;
subplot(3,3,1);
stem(n,x);
title('x(n)');

a=2*exp(0.07+0.35*j)*n;
subplot(3,3,2);
stem(n,a);
title('2*exp(0.07+0.35*j)*n');

[b,nb]=multsinal(x,n,a,n);
subplot(3,3,3);
stem(nb,b);
title('x(n)*2*exp(0.07+0.35*j)*n');

c=cos(0.05*pi*n);
subplot(3,3,4);
stem(n,c);
title('cos(0.05*pi*n)');

[d,nd]=deslocar(x,n,4);
[d,nd]=espelhar(d,nd);
subplot(3,3,5);
stem(nd,d);
title('x(-n-4)');

[e,ne]=multsinal(d,nd,c,n);
subplot(3,3,6);
stem(ne,e);
title('cos(0.05*pi*n)*x(-n-4)');

[f,nf]=adsinal(b,nb,e,ne);
subplot(3,3,7);
stem(nf,f);
title('x2(n)');
