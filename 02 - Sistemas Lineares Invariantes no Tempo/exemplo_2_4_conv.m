clc
clear
close all

% Sinal de entrada
N = 20;
nx = -N:N;
x = 2.^nx;
u = stepseq(0,-N,N);
ue = espelhar(u,nx);
x = x .* ue;

% Resposta ao impulso do sistema LIT
[h,nh] = stepseq(0,-2*N,2*N);

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

axis([-10 15 min(y) max(y)])

ax=gca; ax.FontSize=16;
