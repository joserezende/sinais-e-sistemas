function [x,n] = xnplot(x,n,titulo)
% Plota x(n) como uma seqüência discreta
% --------------------------------------
% [x,n] = xnplot(x,n,titulo)
%
subplot(1,1,1);
stem(n,x,'r');
hold on
plot(n,zeros(size(x)),'k-');
if ~((max(x)==0)&(min(x)==0))
   axis([n(1) n(length(n)) min(x)-(abs(max(x))/5.0) max(x)+(abs(max(x))/5.0)]);
end
%xlabel('n'); ylabel('x(n)');
title(titulo);
hold off
