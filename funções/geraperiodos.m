function [xtil,ntil]=geraperiodos(x,n,P)
%Gera xtil(n) a partir de P per�odos de x(n)
%-------------------------------------------
%[xtil,ntil]=geraperiodos(x,n,P)
%
xtil=x'*ones(1,P);			% gera P colunas de x (x � vetor linha)
xtil=xtil(:);					% concatena��o: gera vetor coluna concatenando as colunas de x
xtil=xtil';		 				% transposi��o
N=length(x); 
ntil=[n(1):(P-1)*(n(N)-n(1)+1)+n(N)];	% gera vetor de �ndices ntil a partir de n



