function [x,n] = xnsubplot6(x,n,k,tit)
% Subplota x(n) como uma seqüência discreta na janela k
% -----------------------------------------------------
% [x,n] = xnsubplot6(x,n,k,tit)
%
% k : n.o da janela (de 1 a 6)
% tit : título da janela k
if k==1
   clf
end
subplot(3,2,k);
stem(n,x,'r');
title(tit);
hold on
plot(n,zeros(size(x)),'k-');
axis([n(1) n(length(n)) min(x)-(abs(max(x))/5.0) max(x)+(abs(max(x))/5.0)]);
hold off
