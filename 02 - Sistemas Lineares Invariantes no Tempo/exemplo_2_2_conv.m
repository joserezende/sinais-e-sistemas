clc
clear
close all

% Sinal de entrada
N = 50;
nx = -N:N;
a = 0.9;
x = a.^nx;
x = x .* stepseq(0,-N,N);

% Resposta ao impulso do SLIT
[h,nh] = stepseq(0,-N,N);

% Saída utilizando a função conv do Matlab
% Não entrega como saída o vetor n
y = conv(x,h);

stem(y,'k','filled','LineWidth',2)
xlabel('índice do vetor y')
ylabel('amplitude de y')
title('saída obtida pela função conv do Matlab')
axis([1 length(y) min(y) max(y)])

ax=gca; ax.FontSize=16;

% Saída utilizando a função conv modificada
[y,ny] = convmod(x,nx,h,nh);

pause

figure
stem(ny,y,'k','filled','LineWidth',2)
xlabel('amostra')
ylabel('amplitude')
title('saída obtida pela função conv modificada')

pause

axis([-50 50 min(y) max(y)])

ax=gca; ax.FontSize=16;
