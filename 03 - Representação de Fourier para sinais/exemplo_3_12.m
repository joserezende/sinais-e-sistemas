clc
clear
close all

M = [4 20 50];
Omega = -2*pi:0.001:2*pi;
for k = 1:length(M)
    n = -2*M(k):2*M(k);
    x = zeros(1,length(n));
    x(n>=-M(k)&n<=M(k)) = 1;
    
    X = sin(Omega*(2*M(k)+1)/2)./sin(Omega/2);
    X(mod(Omega,2*pi)==0) = 2*M(k)+1;
    
    subplot(211)
    stem(n,x,'k','filled','LineWidth',2)
    xlabel('amostra'); ylabel('amplitude')
    title(['M = ' num2str(M(k))])
    ax=gca;
    ax.FontSize=16;

    subplot(212)
    plot(Omega/pi,X,'k','LineWidth',2)
    xlabel('\Omega (em unidades de \pi)'); ylabel('X(e^{j\Omega})')
    ax=gca;
    ax.FontSize=16;
    grid

    pause
end