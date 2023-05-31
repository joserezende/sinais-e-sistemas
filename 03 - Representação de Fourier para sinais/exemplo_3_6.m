clc
clear
close all

T1 = 1;   % Período do sinal x1(t)
T2 = 1/3; % Período do sinal x2(t)

omega1 = 2*pi/T1; % Frequência angular do sinal x1(t)
omega2 = 2*pi/T2; % Frequência angular do sinal x2(t)

t = -3:0.01:3;
x1 = 2*sin(2*pi*t-3); % Sinal x1(t)
x2 = sin(6*pi*t);     % Sinal x2(t)
x  = x1+x2;           % Sinal x(t)

figure(1)
subplot(311)
plot(t,x1,'k','LineWidth',2)
title('x_1(t)=2sen(2\cdot\pi\cdott-3)')
xlabel('tempo')
ylabel('amplitude')
grid
axis tight
ax=gca;
ax.FontSize=16;

subplot(312)
plot(t,x2,'k','LineWidth',2)
title('x_2(t)=sen(6\cdot\pi\cdott)')
xlabel('tempo')
ylabel('amplitude')
grid
axis tight
ax=gca;
ax.FontSize=16;

subplot(313)
plot(t,x,'k','LineWidth',2)
title('x(t) = x_1(t) + x_2(t)')
xlabel('tempo')
ylabel('amplitude')
grid
axis tight
ax=gca;
ax.FontSize=16;

% Coeficientes da série de Fourier X1[k]
X1 = [zeros(1,5) 1i/2 zeros(1,5) -1i/2 zeros(1,5)];

% Coeficientes da série de Fourier X2[k]
X2 = [zeros(1,7) 1i*exp(3i) 0 -1i*exp(-3i) zeros(1,7)];

% Coeficientes da série de Fourier X[k]
X = X1+X2;

k = -fix(length(X)/2):fix(length(X)/2);

figure(2)
subplot(311)
stem(k,abs(X1),'k','filled','LineWidth',2);
xlabel('k');
ylabel('|X_1[k]|')
ax=gca;
ax.FontSize=16;

subplot(312)
stem(k,abs(X2),'k','filled','LineWidth',2);
xlabel('k');
ylabel('|X_2[k]|')
ax=gca;
ax.FontSize=16;

subplot(313)
stem(k,abs(X),'k','filled','LineWidth',2);
xlabel('k');
ylabel('|X[k]|')
ax=gca;
ax.FontSize=16;

figure(3)
subplot(311)
stem(k,angle(X1),'k','filled','LineWidth',2);
xlabel('k');
ylabel('arg\{X_1[k]\}')
ax=gca;
ax.FontSize=16;

subplot(312)
stem(k,angle(X2),'k','filled','LineWidth',2);
xlabel('k');
ylabel('arg\{X_2[k]\}')
ax=gca;
ax.FontSize=16;

subplot(313)
stem(k,angle(X),'k','filled','LineWidth',2);
xlabel('k');
ylabel('arg\{X[k]\}')
ax=gca;
ax.FontSize=16;
