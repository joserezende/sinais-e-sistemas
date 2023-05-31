clc
clear
close all

J = [1 3 7 29 99 500];
t = -0.5:0.001:0.5;
T = 1;
Ts = 1/4;

x = zeros(1,length(t));
x(t >= -Ts & t <= Ts) = 1;

omega0 = 2*pi/T;

for u=1:length(J)
    B = zeros(1,J(u)+1);
    xhat = zeros(1,length(t));
    for k = 0:J(u)
        if k == 0
            B(k+1)=1/2;
        elseif mod(k,2)==0
            B(k+1)=0;
        else
            B(k+1)=2*(-1)^((k-1)/2)/(k*pi);
        end
        xhat = xhat + B(k+1)*cos(k*omega0*t);
    end
    clf
    plot(t,x,'k','LineWidth',2);
    hold on
    plot(t,xhat,'r','LineWidth',2);
    xlabel('t');
    ylabel('x(t)')
    title(['J = ' num2str(J(u))])
    grid
    ax=gca;
    ax.FontSize=16;
    
    pause
end
