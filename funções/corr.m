function rk = corr(x,y,k)
% Calcula a correla��o entre os vetores x e y com deslocamento k
% --------------------------------------------------------------
% rk = corr(x,y,k)
%
% Os vetores x e y podem ter dimens�es diferentes
%
N=length(x); M=length(y); rk=0;
%if(k>=min(N,M)) error('Deslocamento maior que a dimens�o dos vetores!'); end
if(N<M+k)L=N; else L=M; end
for n=k+1:L, rk = rk + x(n)*y(n-k); end

   
