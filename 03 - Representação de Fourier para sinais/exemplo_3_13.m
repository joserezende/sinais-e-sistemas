clc
clear
close all

Omega = -3*pi/2:0.001:3*pi/2;

w = [pi/12 pi/6 pi/2];

for k = 1:length(w)
    W = w(k);

    X = zeros(1,length(Omega));
    X(Omega>=-W & Omega<=W) = 1;
    
    n = -50:50;
    x = sin(W*n)./(pi*n);
    x(n==0) = W/pi;
    
    subplot(211)
    plot(Omega/pi,X,'k','LineWidth',2)
    xlabel('\Omega (em unidades de \pi)'); ylabel('X(e^{j\Omega})')
    title(['W = ' num2str(W/pi) ' (em unidades de \pi)'])
    ax=gca;
    ax.FontSize=16;
    grid
    axis tight
    
    subplot(212)
    stem(n,x,'k','filled','LineWidth',2)
    xlabel('amostra'); ylabel('amplitude')
    ax=gca;
    ax.FontSize=16;
        
    pause
end