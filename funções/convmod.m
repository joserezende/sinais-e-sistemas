function [y,ny] = convmod(x,nx,h,nh)
% Função de convolução modificada (inclui vetores de tempo)
% ---------------------------------------------------------
% [y,ny] = convmod(x,nx,h,nh)
%  y = resultado da convolução
% ny = vetor tempo de y
%  x = sinal de entrada
% nx = vetor tempo de x
%  h = resposta impulsiva do sistema
% nh = vetor tempo de h
%
nyi = nx(1)+nh(1); nyf = nx(length(x)) + nh(length(h));
ny = [nyi:nyf];
y = conv(x,h);
