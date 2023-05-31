clc
clear
close all

T  = 2;      % Período da onda quadrada
wo = 2*pi/T; % Frequência angular
Ts = T/4;    % Tempo em nível lógico alto

% Sinal x(t): onda quadrada de período T
t = 0:0.0001:T;
x = zeros(1,length(t));
x(t <= Ts | t > (T-Ts)) = 1;

% Dois perídos de x(t)
xtil  = x'*ones(1,2);
xtil  = xtil(:);
txtil = linspace(-T,T,length(xtil));

% Coeficientes da FS obtidos por meio da fórmula de síntese
k = -50:50;
X = 2*sin(k*2*pi*Ts/T)./(k*2*pi);
X(k==0) = 2*Ts/T;

figure(1)
subplot(211)
plot(t,x,'k','LineWidth',2)
xlabel('tempo')
ylabel('amplitude')
grid
ax=gca;
ax.FontSize=16;

subplot(212)
plot(txtil,xtil,'k','LineWidth',2)
xlabel('tempo')
ylabel('amplitude')
grid
ax=gca;
ax.FontSize=16;

figure(2)
subplot(221)
plot(t,x,'k','LineWidth',2)
xlabel('tempo')
ylabel('amplitude')
title('T_s/T = 1/4')
grid
ax=gca;
ax.FontSize=16;

subplot(223)
stem(k,X,'k','filled','LineWidth',2)
xlabel('k')
ylabel('X[k]')
ax=gca;
ax.FontSize=16;

Ts = T/16; % Tempo em nível lógico alto modificado

% Sinal x(t): onda quadrada de período T
t = 0:0.0001:T;
x = zeros(1,length(t));
x(t <= Ts | t > (T-Ts)) = 1;

% Espectro de magnitude da onda quadrada com relação Ts/T = 1/16
X = 2*sin(k*2*pi*Ts/T)./(k*2*pi);
X(k==0) = 2*Ts/T;

subplot(222)
plot(t,x,'k','LineWidth',2)
xlabel('tempo')
ylabel('amplitude')
title('T_s/T = 1/16')
grid
ax=gca;
ax.FontSize=16;

subplot(224)
stem(k,X,'k','filled','LineWidth',2)
xlabel('k')
ylabel('X[k]')
ax=gca;
ax.FontSize=16;
