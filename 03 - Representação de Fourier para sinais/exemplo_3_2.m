clc
clear
close all

omega = -20*pi:0.0001:20*pi;

R = 100;
C = 2e-3;

% Resposta em frequência
H = 1/(R*C)./(1/(R*C)+1i.*omega);
absH = abs(H);
angleH = angle(H);

% Ponto de -3 dB
omega0 = 1/(R*C);
H0 = 1/(R*C)./(1/(R*C)+1i.*omega0);
absH0 = abs(H0);
angleH0 = angle(H0);

% Resposta em módulo
subplot(211)
plot(omega/pi,absH,'k')
hold on
plot([-omega0 -omega0]/pi,[0 absH0],'k--')
plot([omega0 omega0]/pi,[0 absH0],'k--')
plot([omega(1) -omega0]/pi,[absH0 absH0],'k--')
plot([omega(1) omega0]/pi,[absH0 absH0],'k--'); grid
xlabel('ângulo em unidades de \pi rad')
ylabel('|H(e^{j\omega})|')

ax=gca;
ax.FontSize=16;

% Resposta em fase
subplot(212)
plot(omega/pi,angleH,'k')
hold on
plot([-omega0 -omega0]/pi,[0 -angleH0],'k--')
plot([omega0 omega0]/pi,[0 angleH0],'k--')
plot([omega(1) -omega0]/pi,[-angleH0 -angleH0],'k--')
plot([omega(1) omega0]/pi,[angleH0 angleH0],'k--'); grid
xlabel('ângulo em unidades de \pi rad')
ylabel('arg[H(e^{j\omega})]')

ax=gca;
ax.FontSize=16;

% Resposta em módulo
figure
plot(omega/pi,20*log10(absH),'k')
% hold on
% plot([-omega0 -omega0]/pi,[0 absH0],'k--')
% plot([omega0 omega0]/pi,[0 absH0],'k--')
% plot([omega(1) -omega0]/pi,[absH0 absH0],'k--')
% plot([omega(1) omega0]/pi,[absH0 absH0],'k--'); grid
xlabel('ângulo em unidades de \pi rad')
ylabel('20*log10|H(e^{j\omega})|')
