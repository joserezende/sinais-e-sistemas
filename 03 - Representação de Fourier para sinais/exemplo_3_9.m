clc
clear
close all

% Onda dente de serra
T = 3/2;
omega0 = 2*pi/T;
t = -1/2:0.001:1;
x = t;

% Tornando a onda dente de serra periódica
xtil  = x'*ones(1,6);
xtil  = xtil(:);
txtil = linspace(-3.5,5.5,length(xtil));

% Coeficientes da série de Fourier
k = -25:25;
X = -2./(3*1i*k*omega0).*(exp(-1i*k*omega0)+exp(1i*k*omega0/2)/2)-2./(3*k.^2*omega0^2).*(-exp(-1i*k*omega0)+exp(1i*k*omega0/2));
X(k==0) = 1/4;

absX = abs(X);     % espectro de magnitude
angleX = angle(X); % espectro de fase

subplot(311)
plot(txtil,xtil,'k','LineWidth',2)
xlabel('tempo')
ylabel('amplitude')
grid
axis tight
ax=gca;
ax.FontSize=16;

subplot(312)
stem(k,absX,'k','filled','LineWidth',2)
xlabel('k')
ylabel('|H[k]|')
grid
ax=gca;
ax.FontSize=16;

subplot(313)
stem(k,angleX,'k','filled','LineWidth',2)
xlabel('k')
ylabel('arg\{X[k]\}')
grid
ax=gca;
ax.FontSize=16;
