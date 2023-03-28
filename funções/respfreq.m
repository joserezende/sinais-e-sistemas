function [H,w] = respfreq(b,a)
% Calcula a resposta em freqüência a partir da equação de diferenças
% ------------------------------------------------------------------
%   [H,w] = respfreq(b,a)
%        b: vetor de coeficientes do numerador (x(n-m))
%        a: vetor de coeficientes do denominador (y(n-l))
%
w = -pi:pi/1000:pi;
m = 0:length(b)-1; l = 0:length(a)-1;
num = b * exp(-j*m'*w); % Numerador
den = a * exp(-j*l'*w); % Denominador
H = num ./ den;
