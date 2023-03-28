clc
clear
close all

C = 2;
t = linspace(-20,20,100);

% exponencial real para a < 0
a = [-0.1 -0.08 -0.06];
x = C*exp(a'*t);

plot(t,x(1,:),'k','LineWidth',2)
hold on
plot(t,x(2,:),'k--','LineWidth',2)
plot(t,x(3,:),'k-.','LineWidth',2)
xlabel('tempo em segundos')
ylabel('amplitude')
legend(['a = ' num2str(a(1))], ...
       ['a = ' num2str(a(2))], ...
       ['a = ' num2str(a(3))], ...
       'Location','northeastoutside')
title('Exponencial real (a < 0)')
grid

ax=gca;
ax.FontSize = 16;

% exponencial real para a > 0
a = [0.1 0.08 0.06];
x = C*exp(a'*t);

figure
plot(t,x(1,:),'k','LineWidth',2)
hold on
plot(t,x(2,:),'k--','LineWidth',2)
plot(t,x(3,:),'k-.','LineWidth',2)
xlabel('tempo em segundos')
ylabel('amplitude')
legend(['a = ' num2str(a(1))], ...
       ['a = ' num2str(a(2))], ...
       ['a = ' num2str(a(3))], ...
       'Location','northeastoutside')
title('Exponencial real (a > 0)')
grid

ax=gca;
ax.FontSize = 16;
