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

% Instantes de tempo do sinal de saída
ny = nh;

% Plotagem do sinal de entrada e da resposta ao impulso
subplot(211)
stem(nx,x,'k','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('sequência de entrada')
axis([-N N 0 1])
ax=gca; ax.FontSize=16;

subplot(212)
stem(nh,h,'kx','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('resposta ao impulso')
ax=gca; ax.FontSize=16;

pause

% Deslocamento da resposta ao impulso para a soma de convolução
n0 = 10;
[h,nh] = deslocar(h,nh,n0);
[h,nh] = espelhar(h,nh);


figure
subplot(211)
stem(nh,h,'kx','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')

hold on

stem(nx,x,'r','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
axis([-N N 0 max(h)])

legend('h[m]',['x[-' num2str(n0) ' - n]'])

pause

% Apresentando resultado do somatório de convolução para cada passo n
y = zeros(1,length(x));
pos = 1;
for n0=-N:N    
    [h,nh] = deslocar(h,nx,n0);
    
    [yv,nyv] = multsinal(x,nx,h,nh);
    
    y(pos) = sum(yv);
    pos = pos + 1;
    
    clf
    subplot(211)
    stem(nh,h,'kx','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    axis([-N N 0 2])
    
    hold on
    
    stem(nx,x,'r','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    
    legend('h[m]',['x[' num2str(n0) ' - n]'])
    axis([-N N 0 max(h)])
    
    subplot(212)
    stem(ny,y,'k','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    legend('y[n]')
    axis([-N N 0 8])
    drawnow
    
    if n0 == -3 % n < 0
        pause
    end
    if n0 == 3 % 0 <= n <= 4
        pause
    end
    if n0 == 5 % 4 < n <= 6
        pause
    end
    if n0 == 8 % 6 < n <= 10
        pause
    end
    if n0 == 11 % n > 10
        pause
    end
end
