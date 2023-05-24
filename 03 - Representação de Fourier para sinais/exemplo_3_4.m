clc
clear
close all

x = [1 1 1 1 1 0 0 0 0 0 0 0 0];
xtil = x'*ones(1,4);
xtil = xtil(:);
n = -length(xtil)/2:length(xtil)/2-1;

subplot(311)
stem(n,xtil,'k','filled','LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
axis tight

ax=gca;
ax.FontSize=16;