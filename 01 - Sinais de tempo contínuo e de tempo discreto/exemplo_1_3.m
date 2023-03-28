% Onda triangular periódica com periodicidade T = 0,2 s amostrada
% a 1 kHz por 1 s.

clc
clear
close all

% Período e frequência fundamentais da onda periódica
T = 0.2;
f = 1/T;

% Frequência de amostragem - define o número de posições 
% do vetor
fs = 1e3;
t = 0:1/fs:1;

% Gerando onda triangular
% Solução de Mathias Simons disponível em:
% https://www.mathworks.com/matlabcentral/answers/460489-how-do-i-plot-a-sawtooth-graph-without-using-the-sawtooth-function
xx = [0 T/2 T];
yy = [-1 1 -1];
x = interp1(xx, yy, mod(t, T));
t = linspace(0,5*T,length(x));

%x = sawtooth(2*pi*f*t,1/2);

% Plotando onda periódica
plot(t,x,'LineWidth',2)
xlabel('Tempo (segundos)')
ylabel('Amplitude')
grid on

% Configurando propriedades da área gráfica
ax = gca;
ax.FontSize = 16;

pause

% Plotando um período da onda triangular
t_T = find(t==T);

figure
plot(t(1:t_T),x(1:t_T),'LineWidth',2)
xlabel('Tempo (segundos)')
ylabel('Amplitude')
grid on

% Configurando propriedades da área gráfica
ax = gca;
ax.FontSize = 16;

pause

% Plotando |x(t)|^2
figure
plot(t(1:t_T),x(1:t_T).^2,'LineWidth',2)
xlabel('Tempo (segundos)')
ylabel('|x(t)|^2')
grid on

% Configurando propriedades da área gráfica
ax = gca;
ax.FontSize = 16;

pause

% Plotando área sob a curva de |x(t)|^2
t_T = find(t==T);
x_T = x(t_T);

figure
area(t(1:t_T),x(1:t_T).^2)
xlabel('Tempo (segundos)')
ylabel('\int_0^T|x(t)|^2dt')
grid on

% Configurando propriedades da área gráfica
ax = gca;
ax.FontSize = 16;
