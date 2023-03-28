function [y,m]=subamost(x,n,M)
% 
%  [y,m]=subamost(x,n,M)
% 
%  Implementa y(n) = x(Mn) : subamostragem (dizimação) pelo fator M
%
m=ceil(min(n)/M):floor(max(n)/M);
y=zeros(1,length(m));
pos_donzero=find(n==0);
pos_domzero=find(m==0);
if isempty(pos_donzero + pos_domzero) % sequencia orig não tem n = 0!
   for i = 1:length(y)
       y(i)=x(i*M);
   end
else
   for i=pos_domzero:length(m)
      y(i)=x(pos_donzero+M*(i-pos_domzero));
   end
   nRef=pos_domzero-1;
   for i=nRef:-1:1
       y(i)=x(pos_donzero-M-M*(nRef-i));
   end 
end
