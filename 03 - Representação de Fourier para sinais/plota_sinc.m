clc
clear
close all

u = -10:0.001:10;
s = sinc(u);

plot(u,s,'k','LineWidth',2)
xlabel('u')
ylabel('sinc(u)')
grid
ax=gca;
ax.FontSize=16;