clc
clear
close all

Omega = -4*pi:0.01:4*pi;

% Resposta em frequência
H1 = exp(-1i*Omega/2).*cos(Omega/2);
absH1 = abs(H1);
angleH1 = angle(H1);

% Resposta em módulo
subplot(211)
plot(Omega,absH1,'k');grid
plot(Omega/pi,absH1,'k');grid
xlabel('ângulo em unidades de \pi')
ylabel('|H_1(e^{j\Omega})|')

ax=gca;
ax.FontSize=16;

% Resposta em fase
subplot(212)
plot(Omega/pi,angleH1,'k');grid
xlabel('ângulo em unidades de \pi')
ylabel('arg[H_1(e^{j\Omega})]')

ax=gca;
ax.FontSize=16;

% Resposta em frequência
H2 = 1i*exp(-1i*Omega/2).*sin(Omega/2);
absH2 = abs(H2);
angleH2 = angle(H2);

figure
% Resposta em módulo
subplot(211)
plot(Omega,absH2,'k');grid
plot(Omega/pi,absH2,'k');grid
xlabel('ângulo em unidades de \pi')
ylabel('|H_2(e^{j\Omega})|')

ax=gca;
ax.FontSize=16;

% Resposta em fase
subplot(212)
plot(Omega/pi,angleH2,'k');grid
xlabel('ângulo em unidades de \pi')
ylabel('arg[H_2(e^{j\Omega})]')

ax=gca;
ax.FontSize=16;

