function [xs, xa, m] = sim_antisim(x,n)
% Decomposição de um sinal complexo em componente simétrica e anti-simétrica
% --------------------------------------------------------------------------
% [xs, xa, m] = sim_antisim(x,n)
%
m = -fliplr(n);
m1 = min([m,n]); m2 = max([m,n]); m = m1:m2;
nm = n(1)-m(1); n1 = 1:length(n);
x1 = zeros(1,length(m));
x1(n1+nm) = x; x = x1;
xs = 0.5*(x + conj(fliplr(x)));
xa = 0.5*(x - conj(fliplr(x)));

