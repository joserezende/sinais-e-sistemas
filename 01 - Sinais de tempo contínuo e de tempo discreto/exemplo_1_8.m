% Alteração da taxa de amostragem por um fator inteiro

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
n = [-8:-1 n 8:15];

% Diminuição da frequência de amostragem M = 2
M = 2;
xtild = downsample(xtil,M);
nd = n(1):M:n(end);

% Aumento da frequência de amostragem L = 2
L = 2;
xtili = upsample(xtil,L);
ni = n(1):(L*length(n))+n(1)-1;

% Plotando sequência periódica original
stem(n,xtil,'LineWidth',2)
xlabel('Amostras')
ylabel('Amplitude')
title('Sequência original')

ax = gca;
ax.FontSize = 16;

pause

% Plotando sequência periódica subamostrada
figure
stem(nd,xtild,'LineWidth',2)
xlabel('Amostras')
ylabel('Amplitude')
title(['Sequência subamostrada: M = ' num2str(M)])

ax = gca;
ax.FontSize = 16;

pause

% Plotando sequência periódica superamostrada
figure
stem(ni,xtili,'LineWidth',2)
xlabel('Amostras')
ylabel('Amplitude')
title(['Sequência superamostrada: L = ' num2str(L)])

ax = gca;
ax.FontSize = 16;

