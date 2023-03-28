function [y,ny] = deslocar(x,nx,n0)
% implementa y(n) = x(n-n0)
% -------------------------
% [y,ny] = deslocar(x,nx,n0)
%
% x: sinal de entrada (vetor linha)
% nx: base de tempo de x
%
% y: sinal deslocado de n0 (vetor linha)
% ny: base de tempo de y
%
ny = nx+n0;
y = x;

