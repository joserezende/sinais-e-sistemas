function S = produtoamostras(x,n,n1,n2)
% ---------------------------------
% Sintaxe: S = produtoamostras(x,n,n1,n2)
% onde x - vetor valor da amostra
%      n - vetor das amostras
%      n1- amostra 1
%      n2- amostra 2
% ---------------------------------
if ( (n1<n(1)) | (n2>n(length(n))) | (n1>n2))
   error('ERRO: Os índices devem estar num intervalo válido!')
else
   S=prod(x(find(n==n1):find(n==n2)));
end