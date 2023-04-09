clc
clear
close all

% Sinal de entrada
N = 50;
[x,n] = stepseq(0,-N,N);

% Resposta ao impulso do SLIT
nh = -N:N;
h = [zeros(1,N) 2 1 zeros(1,N-1)];

% Plotagem do sinal de entrada e da resposta ao impulso
subplot(121)
stem(n,x,'k','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('x[n] = u[n]')
axis([-10 10 0 1])
ax=gca; ax.FontSize=16;

subplot(122)
stem(nh,h,'kx','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('h[n] = 2\delta[n] + \delta[n-1]')
axis([-10 10 0 2])
ax=gca; ax.FontSize=16;

pause

% Deslocamento do sinal de entrada para a soma de convolução
n0 = 50;
[x,nx] = deslocar(x,n,n0);
[x,nx] = espelhar(x,nx);

figure
subplot(211)
stem(nh,h,'kx','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')

hold on

stem(nx,x,'r','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')

legend('h[m]',['x[-' num2str(n0) ' - n]'])

axis([-10 10 0 2])

pause

% Apresentando resultado do somatório de convolução para cada passo n
y = zeros(1,length(x));
pos = 1;
for n0=-N:20
    [x,nx] = deslocar(x,n,n0);
    
    [yv,nyv] = multsinal(x,nx,h,nh);
    
    y(pos) = sum(yv);
    pos = pos + 1;
    
    clf
    subplot(211)
    stem(nh,h,'kx','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    axis([-10 10 0 2])
    
    hold on
    
    stem(nx,x,'r','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    
    legend('h[m]',['x[' num2str(n0) ' - n]'])
    axis([-10 10 0 2])
    
    subplot(212)
    stem(n,y,'k','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    legend('y[n]')
    axis([-10 10 0 3])
    drawnow
    
end
