function [x,n] = xnsubplot3(x,n,k,tit)
% Subplota x(n) como uma seq��ncia discreta na janela k
% -----------------------------------------------------
% [x,n] = xnsubplot3(x,n,k,tit)
%
% k : n.o da janela (de 1 a 3)
% tit : t�tulo da janela k
if k==1
   clf
end
subplot(3,1,k);
stem(n,x,'r');
title(tit);
hold on
plot(n,zeros(size(x)),'k-');
if ~((max(x)==0)&(min(x)==0))
	axis([n(1) n(length(n)) min(x)-(abs(max(x))/5.0) max(x)+(abs(max(x))/5.0)]);
end
hold off
