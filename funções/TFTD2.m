function [w,X]=TFTD(n,x,M,l)
%Calcula a Transformada de Fourier de Tempo Discreto de x(n)(entre -l*pi e l*pi) 
%-------------------------------------------------------------------------------
%  [w,X]=TFTD(n,x,M,l)
%     n: vetor tempo discreto (base de tempo de x(n))
%     x: vetor sinal digital x(n)
%     M: número de pontos de frequencia digital entre 0 e pi
%     l: define o intervalo de cálculo da TFTD
%     w: vetor frequencia digital (2M+1 pontos entre -l*pi e l*pi) 
%     X: vetor TFTD
%
k=[-l*M:l*M];
w=(pi/M)*k;
X=x*exp((-j*(n'*w));

