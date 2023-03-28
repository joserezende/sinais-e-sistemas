function [xtil,ntil]=geraperiodos(x,n,P)
%Gera xtil(n) a partir de P períodos de x(n)
%-------------------------------------------
%[xtil,ntil]=geraperiodos(x,n,P)
%
xtil=x'*ones(1,P);			% gera P colunas de x (x é vetor linha)
xtil=xtil(:);					% concatenação: gera vetor coluna concatenando as colunas de x
xtil=xtil';		 				% transposição
N=length(x); 
ntil=[n(1):(P-1)*(n(N)-n(1)+1)+n(N)];	% gera vetor de índices ntil a partir de n



