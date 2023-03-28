% Encontar o período fundamental do sinal de tempo discreto
%
% x[n]=exp(i*(2*pi/3)*n)+exp(i*(4*pi/4)*n)
% 
% O primeiro termo possui período fundamental de 3 amostras
% O segundo termo possui período fundamental de 8 amostras
% 
% Qual é o instante de tempo, comum aos dois termos do sinal,
% em que, para ambos, os valores de suas respectivas exponencias
% se repetem?

clc
clear
close all

% Frequências fundamentais
w01 = 2*pi/3;
w02 = 3*pi/4;

% Parcelas do sinal x[n]
n = 0:50;

x1 = exp(1i*w01.*n);
x2 = exp(1i*w02.*n);

% Cálculo do período fundamental (N) e o múltiplo inteiro
% de 2*pi (m) => w0/(2*pi) = m/N
[m1,N1] = numden(sym(w01/(2*pi)));
[m2,N2] = numden(sym(w02/(2*pi)));

% Sinal resultante e período fundamental
x = x1 + x2;
N = lcm(N1,N2);

% Plotar sequência x1[n]
subplot(311)
stem(n,real(x1),'k','LineWidth',2)
xlabel('amostras')
ylabel('Re\{x_1[n]\}')
ax = gca; ax.FontSize = 16;

pause

% Destacar período fundamental de x1[n]
hold on
stem(n(1:N1),real(x1(1:N1)),'r','LineWidth',2)

pause

% Plotar sequência x2[n]
subplot(312)
stem(n,real(x2),'k','LineWidth',2)
xlabel('amostras')
ylabel('Re\{x_2[n]\}')
ax=gca; ax.FontSize = 16;

pause

% Destacar período fundamental de x2[n]
hold on
stem(n(1:N2),real(x2(1:N2)),'r','LineWidth',2)

pause

% Destacar amostras de x1[n] de acordo com o período
% fundamental do sinal resultante x[n]
subplot(311)
hold on
stem(n(1:N+1),real(x1(1:N+1)),'b','LineWidth',2)

pause

% Destacar amostras de x2[n] de acordo com o período
% fundamental do sinal resultante x[n]
subplot(312)
hold on
stem(n(1:N+1),real(x2(1:N+1)),'b','LineWidth',2)

pause

subplot(313)
stem(n,real(x),'k','LineWidth',2)
xlabel('amostras')
ylabel('Re\{x[n]\}')
ax=gca; ax.FontSize = 16;

pause

% Destacar amostras de x[n] dentro do período fundamental
hold on
stem(n(1:N+1),real(x(1:N+1)),'b','LineWidth',2)
