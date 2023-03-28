% Pulso retangular de duração T = 50 ms, amostrado
% a 10 kHz por 50 ms.

clc
clear
close all

% Amplitude do pulso retangular
A = 2;

% Duração do pulso retangular
T = 50e-3;

% Passo do vetor
passo = 1/10e3;

% Geração do pulso retangular de duração T
t1 = -T/2:passo:T/2;
x1 = A * ones(1,length(t1));

t01 = -T:passo:-T/2;
t02 = T/2:passo:T;

t = [t01 t1 t02];
x = [zeros(1,length(t01)) x1 zeros(1,length(t02))];

% Matlab 2009 do campus não possui a toolbox
% Signal processing
%t = -T:1/10e3:T;
%x = A*rectpuls(t,T);

plot(t,x,'LineWidth',2)
xlabel('tempo em segundos')
ylabel('x(t)')
axis([-T T 0 (A+0.2)])
grid

ax = gca;
ax.FontSize = 16;

pause

% Plotagem de |x(t)|^2
x_sq = x.^2;

figure
plot(t,x_sq,'LineWidth',2)
xlabel('tempo em segundos')
ylabel('|x(t)|^2')
axis([-T T 0 (max(x_sq)+0.2)])
grid

ax = gca;
ax.FontSize = 16;

pause

% Área sob a curva de |x(t)|^2
figure
plot(t,x_sq,'LineWidth',2)
hold on
area(t(find(t==0):end),x_sq(find(t==0):end))
xlabel('tempo em segundos')
ylabel('2\cdot\int_0^{T/2}|x(t)|^2dt')
axis([-T T 0 (max(x_sq)+1)])
grid

ax = gca;
ax.FontSize = 16;
ax.YAxisLocation = 'origin';
