function [x,n] = degrau(n0,n1,n2)
% Gera x(n) = degrau(n-n0); n1 <= n,n0 <= n2
% ----------------------------------------------
% [x,n] = degrau(n0,n1,n2)
%
if((n0 < n1)|(n0 > n2)|(n1 > n2)) error('Use n1<=n0<=n2')
end  
n = [n1:n2];  x = [(n-n0) >= 0];