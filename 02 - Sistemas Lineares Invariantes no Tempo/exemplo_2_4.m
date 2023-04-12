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
nh1 = nh;

% Instantes de tempo do sinal de saída
ny = nx;

% Plotagem do sinal de entrada e da resposta ao impulso
subplot(121)
stem(nx,x,'k','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('Sinal de entrada')
axis([-20 20 0 1])

ax=gca; ax.FontSize=16;

subplot(122)
stem(nh,h,'kx','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('h[n] = u[n]')
title('Resposta ao impulso unitário')

axis([-20 20 0 1])

ax=gca; ax.FontSize=16;

pause

n0 = round(nx(end)/2);
[h,nh] = deslocar(h,nh,n0);
[h,nh] = espelhar(h,nh);

figure
subplot(211)

stem(nx,x,'r','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')

hold on

stem(nh,h,'kx','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('Processo de convolução')
axis([-N N 0 max(h)])

ax=gca; ax.FontSize=16;

legend('x[m]',['h[-' num2str(n0) ' - n]'])

ax=gca; ax.FontSize=16;

pause

% Apresentando resultado do somatório de convolução para cada passo n
y = zeros(1,length(x));
pos = 1;
for n=-N:N    
    [h,nh] = deslocar(h,nh1,n);
    
    [yv,nyv] = multsinal(x,nx,h,nh);
    
    y(pos) = sum(yv);
    pos = pos + 1;
    
    clf
    subplot(211)

    stem(nx,x,'r','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')

    hold on
    
    stem(nh,h,'kx','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    title('Processo de convolução')
    axis([-N N 0 2])
        
    legend('x[m]',['h[' num2str(n) ' - n]'])
    axis([-N N 0 max(h)])
    
    ax=gca; ax.FontSize=16;
    
    subplot(212)
    stem(ny,y,'k','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    legend('y[n]')
    title('Sinal de saída')
    axis([-N N 0 3])
    ax=gca; ax.FontSize=16;
    
    drawnow
    
    if n == -3 % n < 0
        pause
    end
    if n == 3 % n >= 0
        pause
    end
end
