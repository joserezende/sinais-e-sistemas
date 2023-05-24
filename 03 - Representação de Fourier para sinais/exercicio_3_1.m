clc
clear
close all

% Sinal de tempo discreto
N = 24;
phi = 3*pi/8;
n = 0:N-1;
x = 1+sin(pi/12*n+phi);

% Extração da SFTD
X = fft(x)/N;

% Zerar posições com amplitudes muito pequenas
tol = 1e-6;
X(abs(X) < tol) = 0;

% Módulo dos coeficientes da SFTD (6 períodos)
abs_X = abs(X)' * ones(1,6);
abs_X = abs_X(:);

% Fase dos coeficientes da SFTD (6 períodos)
angle_X = angle(X)/pi;
angle_X = angle_X' * ones(1,6);
angle_X = angle_X(:);

% Determinação dos valores de k para X[k]
k = -length(angle_X)/2:length(angle_X)/2-1;

% Plota sinal de tempo discreto
subplot(311)
stem(n,x,'k','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
axis tight

ax=gca;
ax.FontSize=16;

% Plota módulo dos coeficientes da SFTD
subplot(312)
stem(k,abs_X,'k','filled','LineWidth',2)
xlabel('k')
ylabel('|X[k]|')
axis tight

ax=gca;
ax.FontSize=16;

% Plota fase dos coeficientes da SFTD
subplot(313)
stem(k,angle_X,'k','filled','LineWidth',2)
xlabel('k')
ylabel('arg\{X[k]\}')
axis tight

ax=gca;
ax.FontSize=16;
