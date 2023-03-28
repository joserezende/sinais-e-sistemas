% Plota as funções impulso unitário e degrau unitário
clc
clear
close all 

% Sinais de tempo discreto
[x1,n1] = impulso(0,-20,20);
[x2,n2] = stepseq(0,-20,20);

% Impulso unitário escrito como delta[x] = u[n]-u[n-1]
[x3,n3] = stepseq(1,-20,20);
x4 = x2 - x3;
n4 = n3;

% Degrau unitário de tempo contínuo
[u,t] = stepfun(0,-20,20,1e-3);

stem(n1,x1,'k','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('Função impulso unitário \delta[n]')
ax = gca; ax.FontSize=16;

figure

stem(n2,x2,'k','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('Função degrau unitário u[n]')
ax = gca; ax.FontSize=16;

figure

subplot(311)
stem(n2,x2,'k','LineWidth',2)
ylabel('amplitude')
title('Função degrau unitário u[n]')
ax = gca; ax.FontSize=16;

subplot(312)
stem(n3,x3,'k','LineWidth',2)
ylabel('amplitude')
title('Função degrau unitário u[n-1]')
ax = gca; ax.FontSize=16;

subplot(313)
stem(n4,x4,'k','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('\delta[n] = u[n] - u[n-1]')
ax = gca; ax.FontSize=16;

figure

plot(t,u,'k','LineWidth',2)
xlabel('tempo')
ylabel('amplitude')
title('Função degrau unitário u(t)')
axis([t(1) t(end) 0 1.2])
grid; ax = gca; ax.FontSize=16;

figure

stem(n1(n1==0),1,'k^','filled','LineWidth',2)
xlabel('tempo')
ylabel('amplitude')
title('Função impulso unitário \delta(t)')
axis([n1(1) n1(end) 0 1.2])
ax = gca; ax.FontSize=16;
