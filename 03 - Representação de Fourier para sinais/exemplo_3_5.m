clc
clear
close all

% Período do sinal x(t)
T = 4;

% Frequência angular do sinal x(t)
omega_0 = 2*pi/T;

% Sinal x(t)
t = -8:0.01:8;
x = 3*cos(pi/2*t+pi/4);

subplot(311)
plot(t,x,'k','LineWidth',2)
title('x(t)=3cos(\pi/2t+\pi/4)')
xlabel('tempo (s)')
ylabel('amplitude')
grid
axis tight
ax=gca;
ax.FontSize=16;

pause

% Coeficientes da série de Fourier
X = [0 0 3/2*exp(-1i*pi/4) 0 3/2*exp(1i*pi/4) 0 0];
k = -3:3;

subplot(312)
stem(k,abs(X),'k','filled','LineWidth',2);
xlabel('k');
ylabel('|X[k]|')
ax=gca;
ax.FontSize=16;

pause

subplot(313)
stem(k,angle(X),'k','filled','LineWidth',2);
xlabel('k');
ylabel('arg\{X[k]\}')
ax=gca;
ax.FontSize=16;

