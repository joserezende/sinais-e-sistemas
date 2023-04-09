clc
clear
close all

% Sinal de entrada
N = 50;
n = -N:N;
a = 0.9;
x = a.^n;
x = x .* stepseq(0,-N,N);

% Resposta ao impulso do SLIT
[h,nh] = stepseq(0,-N,N);

% Plotagem do sinal de entrada e da resposta ao impulso
subplot(211)
stem(n,x,'k','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title(['x[n] = ' num2str(a) '^nu[n]'])
axis([-20 20 0 1])

subplot(212)
stem(nh,h,'kx','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('h[n] = u[n]')
axis([-20 20 0 1])

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

axis([-N N 0 2])

pause

% Apresentando resultado do somatório de convolução para cada passo n
y = zeros(1,length(x));
pos = 1;
for n0=-N:N
    [x,nx] = deslocar(x,n,n0);
    
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
    axis([-N N 0 2])
    
    subplot(212)
    stem(n,y,'k','filled','LineWidth',2)
    xlabel('amostras')
    ylabel('amplitude')
    legend('y[n]')
    axis([-N N 0 10])
    drawnow
    
end
