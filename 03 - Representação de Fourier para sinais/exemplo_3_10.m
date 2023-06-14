clc
clear
close all

% Equação para obtenção dos coeficientes da FS
% mediante os cálculos apresentados no exemplo
k = -25:25;
Yk = 10./(1i*2*k*pi + 10) .* sin(k*pi/2)./(k*pi);
Yk(k==0) = 1/2;

% Espectros de magnitude e fase
absYk = abs(Yk);
argYk = angle(Yk);

% Plotagem do espectro de magnitude
subplot(311)
stem(k,absYk,'k','filled','LineWidth',2)
xlabel('k'), ylabel('|Y[k]|')
ax=gca;
ax.FontSize=16;

% Plotagem do espectro de fase
subplot(312)
stem(k,argYk,'k','filled','LineWidth',2)
xlabel('k'), ylabel('arg\{Y[k]\}')
ax=gca;
ax.FontSize=16;

% Construção do sinal de saída em função dos seus respectivos
% coeficientes da FS
omega0 = 2*pi;
t = -0.5:0.001:0.5;
Nt = length(t);
y = zeros(1,Nt);

% TODO: Reescrever na forma matricial
for nt = 1:Nt
    y(nt) = 0;
    for k = -100:100
        if k == 0
            y(nt) = y(nt) + exp(1i*k*omega0*t(nt))/2;
        else
            y(nt) = y(nt) + (10/(1i*2*k*pi + 10)*sin(k*pi/2)/(k*pi))*exp(1i*k*omega0*t(nt));
        end
    end
end

subplot(313)
plot(t,real(y),'k','LineWidth',2)
xlabel('t'); ylabel('y(t)'); grid
ax=gca;
ax.FontSize=16;
