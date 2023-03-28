% Decomposição do pulso retangular em compoentes par e ímpar

clc
clear
close all

n = 0:10; 
x = stepseq(0,0,10)-stepseq(10,0,10);

[xe,xo,m] = parimpar(x,n);

stem(n,x,'LineWidth',2)
title('Pulso retangular')
xlabel('amostras')
ylabel('amplitude')
axis([-1,10,0,1.2])

ax = gca;
ax.FontSize = 16;

pause

figure
stem(m,xe,'LineWidth',2)
title('Componente par')
xlabel('amostras')
ylabel('amplitude')
axis([-10,10,0,1.2])

ax = gca;
ax.FontSize = 16;

pause

figure
stem(m,xo,'LineWidth',2)
title('Componente ímpar')
xlabel('amostras')
ylabel('amplitude')
axis([-10,10,-0.6,0.6])

ax = gca;
ax.FontSize = 16;
