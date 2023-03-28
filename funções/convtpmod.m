function [y,ny,H] = convtpmod(x,nx,h,nh)
%		
% Convolução Linear Discreta usando matriz Toeplitz : y = Hx
% ----------------------------------------------------------
%
%     [y,ny,H] = convtpmod(x,nx,h,nh)
%
%  y = seqüência y[n] - saída (vetor linha)
% ny = vetor tempo de y
%  H = Matriz Toeplitz
%
%  x = sequência x[n] - entrada (vetor linha) 
% nx = vetor (linha) tempo de x
%  h = resposta impulsiva do sistema (vetor linha)
% nh = vetor (linha) tempo de h 
%
nyi = nx(1) + nh(1);
nyf = nx(length(x)) + nh(length(h));
ny = [nyi:nyf];

k = length(ny);     				% tamanho dos vetores resultantes y e ny
hl = zeros(size(x));				% vetor linha com tamanho de x(n)
hl(1) = h(1);						% hl = primeira linha da matriz H
hc = h;              
hc(length(hc)+1:k) = zeros;   % hc = primeira coluna da matriz H   

H = toeplitz(hc,hl);
y = H*x';
y = y';

  

