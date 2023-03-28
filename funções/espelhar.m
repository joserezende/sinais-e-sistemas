function [y,n] = espelhar(x,n)
% implementa y(n) = x(-n)
% -----------------------
% [y,n] = espelhar(x,n)
%
y = fliplr(x); n = -fliplr(n);