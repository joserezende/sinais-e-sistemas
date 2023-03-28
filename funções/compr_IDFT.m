function [xn] = compr_idft(Xk,N,fc)
% Computes "Frequency-Compressed" Inverse Discrete Transform
% ----------------------------------------------------------
% [xn] = idft(Xk,N)
% xn = N-point sequence over 0 <= n <= N-1
% Xk = DFT coeff. array over 0 <= k <= N-1
%  N = length of DFT
%  fc = fator de compressão da escala de frequencias
%
n = [0:1:N-1];                       % row vector for n
k = [0:1:N-1];                       % row vecor for k
WN = exp(-j*2*pi/(fc*N));            % Wn factor
nk = n'*k;                           % creates a N by N matrix of nk values
WNnk = WN .^ (-nk);                  % IDFT matrix
xn = (Xk * WNnk)/N;                  % row vector for IDFT values
