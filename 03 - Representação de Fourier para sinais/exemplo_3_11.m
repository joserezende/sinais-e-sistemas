clc
clear
close all

% Sinal de tempo discreto (sequência)
alpha = 0.5;
[u,n] = stepseq(0,-20,20);
x = alpha.^n.*u;

% TFTD da sequência
Omega = -4*pi:0.001:4*pi;
X = 1 ./ (1-alpha*exp(-1i*Omega));
absX = abs(X);
angleX = angle(X);

subplot(131)
stem(n,x,'filled','k','LineWidth',2)
xlabel('amostras'); ylabel('amplitude')
title(['x[n] = ' num2str(alpha) '^nu[n]'])
ax=gca;
ax.FontSize=16;

subplot(132)
plot(Omega/pi,absX,'k','LineWidth',2); grid
xlabel('\Omega (em unidades de \pi)'); ylabel('|X(e^{j\Omega})|')
axis([Omega(1)/pi Omega(end)/pi 0 2.5])
ax=gca;
ax.FontSize=16;

subplot(133)
plot(Omega/pi,angleX,'k','LineWidth',2)
xlabel('\Omega (em unidades de \pi)'); ylabel('arg\{X(e^{j\Omega})\}'); grid
axis([Omega(1)/pi Omega(end)/pi -1.5 1.5])
ax=gca;
ax.FontSize=16;
