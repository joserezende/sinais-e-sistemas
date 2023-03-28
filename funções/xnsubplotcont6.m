function [x,n] = xnsubplotcont6(x,n,k,cor,tit)
% Subplota x(n) como um sinal contínuo na janela k
% -------------------------------------------------
% [x,n] = xnsubplotcont6(x,n,k,cor,tit)
%
% k : n.o da janela (de 1 a 6)
% cor : cor do traço a ser plotado
% tit : título da janela k
if k==1
   clf
end
subplot(3,2,k);
plot(n,x,cor);
title(tit);
hold on
plot(n,zeros(size(x)),'k-');
axis([n(1) n(length(n)) min(x)-(abs(max(x))/5.0) max(x)+(abs(max(x))/5.0)]);
hold off
