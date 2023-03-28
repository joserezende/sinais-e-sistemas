function [rxy,nr] = fcorr(x,nx,y,ny)
% Calcula a função de correlação entre os sinais discretos x e y
% --------------------------------------------------------------
% [rxy,nr] = fcorr(x,nx,y,ny)
% x : primeiro sinal
% nx : vetor de tempo de x
% y : segundo sinal
% ny : vetor de tempo de y
[y,ny]=espelhar(y,ny);
[rxy,nr]=convmod(x,nx,y,ny);
