% Geração de sequências periódicas

clc
clear
close all

% Gerando sequência - 1 período
[x1,n1] = stepseq(0,0,3);
[x2,n2] = stepseq(4,4,7);

x = [x1 -x2];
n = [n1 n2];

% Gerando 3 períodos a partir da sequência original x[n]
P = 3;
xtil = x' * ones(1,P);
xtil = xtil(:)';

% Plotando sequência periódica
n = [-8:-1 n 8:15];
stem(n,xtil,'LineWidth',2)
xlabel('Amostras')
ylabel('Amplitude')

ax = gca;
ax.FontSize = 16;

pause

% Cálculo da potência média do sinal x[n]
pot_media = sum(x.^2)/length(x);
fprintf('Potência média do sinal de tempo discreto: %.2f\n', pot_media);
