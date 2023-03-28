clc
clear
close all

A = 2;
f = [60 120 180];
omega = 2*pi.*f;
t = linspace(-3/f(1),3/f(1),1000);

% sinal senoidal
x = A*cos(omega'*t);

subplot(311)
plot(t,x(1,:),'LineWidth',2)
xlabel('tempo em segundos')
ylabel('amplitude')
title('Sinais senoidais')
grid

ax=gca;
ax.FontSize = 16;

subplot(312)
plot(t,x(2,:),'LineWidth',2)
xlabel('tempo em segundos')
ylabel('amplitude')
grid

ax=gca;
ax.FontSize = 16;

subplot(313)
plot(t,x(3,:),'LineWidth',2)
xlabel('tempo em segundos')
ylabel('amplitude')
grid

ax=gca;
ax.FontSize = 16;
