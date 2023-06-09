function [x,n] = xnsubplot2(x,n,k,tit)
% Subplota x(n) como uma seq��ncia discreta na janela k
% -----------------------------------------------------
% [x,n] = xnsubplot2(x,n,k,tit)
%
% k : n.o da janela (1 ou 2)
% tit : t�tulo da janela k
%
subplot(2,1,k);
stem(n,x,'r');
title(tit);
hold on
plot(n,zeros(size(x)),'k-');
if ~((max(x)==0)&(min(x)==0))
	axis([n(1) n(length(n)) min(x)-(abs(max(x))/5.0) max(x)+(abs(max(x))/5.0)]);
end
hold off
