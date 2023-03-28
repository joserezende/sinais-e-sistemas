% Pulso retangular de tempo discreto criada por meio
% da subtração de duas funções degrau unitário

clc
clear
close all

[x1,n1] = stepseq(-1,-4,4); % amostras não nulas a partir de n = -1
[x2,n2] = stepseq(2,-4,4);  % amostras não nulas a partir de n = 2

n = n1;      % eixo dos tempos da sequência resultante
x = x1 - x2; % pulso retangular entre -1 <= n <= 1

energia = sum(x.^2); % cálculo da energia total do sinal

fprintf('Energia total do sinal de tempo discreto: %.2f\n', energia);

% Plotagem da sequência resultante
stem(n,x,'LineWidth',2)
xlabel('Amostras')
ylabel('Amplitude')
axis([n(1) n(end) 0 1.2])

% Configurando propriedades do gráfico
ax = gca;
ax.FontSize = 16;
