clc
clear
close all

N = 20;

% Sinal de entrada
[x1,n1] = stepseq(0,-N,N);
[x2,n2] = stepseq(5,-N,N);

nx = n2;
x = x1 - x2;

% Resposta ao impulso do SLIT
nh = nx;
alpha = 1.1;
[u1,n3] = stepseq(0,-N,N);
[u2,n4] = stepseq(7,-N,N);
u = u1 - u2;
h = alpha.^nh .* u;

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
