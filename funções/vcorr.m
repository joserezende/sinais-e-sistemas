function rk = vcorr(x,y,K)
% Calcula o vetor de correlação entre os vetores x e y com deslocamento  de 0 a K-1
% ---------------------------------------------------------------------------------
% rk = vcorr(x,y,K)
%
% Os vetores x e y podem ter dimensões diferentes
%
N=length(x); M=length(y); rk=zeros(1,K);
%if(k>=min(N,M)) error('Deslocamento maior que a dimensão dos vetores!'); end
if(N<M+K)L=N; else L=M; end
for k=0:K-1,
   for n=k+1:L,
      rk(k+1) = rk(k+1) + x(n)*y(n-k);
   end
end


   
