% Onda quadrada periódica com periodicidade T = 50 ms amostrada
% a 10 kHz por 250 ms. Duty cycle de 50%

clc
clear
close all

% Período fundamental da onda quadrada (em segundos)
T = 50e-3;

% Frequência de amostragem 10 kHz
fs = 10e3;

% Gerando sequência - 1 período
t_ciclo = 0:1/fs:T;

% Gerando 5 períodos a partir da sequência original x[n]
% Solução disponível no livro:
% INGLE, V. K.; PROAKIS, J. G. Digital signal processing using MATLAB. 3.
% ed. Stamford: Cengage Learning, 2012.

x1 = ones(1,round(length(t_ciclo)/2));
x2 = ones(1,round(length(t_ciclo)/2 - 1));

x_ciclo = [x1 -x2];
P = 5;
x = x_ciclo' * ones(1,P);
x = x(:)';
t = linspace(0,P*T,length(x));

% Geração da onda quadrada periódica
%duty_cicle = 50;
%t = 0:1/10e3:250e-3;
%x = square(2*pi/T*t,duty_cicle);

plot(t,x,'LineWidth',2)
xlabel('tempo em segundos')
ylabel('x(t)')
axis([0 max(t) -1.5 1.5])
grid

ax = gca;
ax.FontSize = 16;

pause

% Plotagem de um ciclo da onda quadrada
% t_ciclo = 0:1/10e3:T;
% x_ciclo = square(2*pi/T*t_ciclo,duty_cicle);

figure
plot(t_ciclo,x_ciclo,'LineWidth',2)
xlabel('tempo em segundos')
ylabel('x(t)')
axis([0 max(t_ciclo) -1.5 1.5])
grid

ax = gca;
ax.FontSize = 16;

pause

% Plotagem de |x(t)|^2 dentro de um ciclo
x_ciclo_sq = x_ciclo.^2;

% subplot(313)
figure
plot(t_ciclo,x_ciclo_sq,'LineWidth',2)
xlabel('tempo em segundos')
ylabel('|x(t)|^2')
axis([0 max(t_ciclo) 0 1.5])
grid

ax = gca;
ax.FontSize = 16;

pause

% Área sob a curva de |x(t)|^2
figure
area(t_ciclo,x_ciclo_sq)
xlabel('tempo em segundos')
ylabel('\int_0^T|x(t)|^2dt')
axis([0 max(t_ciclo) 0 1.5])
grid

ax = gca;
ax.FontSize = 16;
