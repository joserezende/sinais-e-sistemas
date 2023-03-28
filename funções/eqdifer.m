function y = eqdifer(b,a,x)
% Implementa a equação de diferenças:
% a(1)*y(n)+ a(2)*y(n-1) + ... + a(na+1)*y(n-na)
%           = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
%
% y = eqdifer(b,a,x)
% 
% onde
% b = [b(1) b(2) ... b(nb+1)]
% a = [a(1) a(2) ... a(na+1)]
% x : sinal de entrada
% y : sinal de saída
nb=length(b)-1;
na=length(a)-1;
be=fliplr(b);
ae1=fliplr(a);
nae1=1:na+1;
ae=ae1(find(nae1<=na));
nx=length(x);
xt=zeros(nb+nx,1);
yt=zeros(na+nx,1);
ntx=1:nb+nx;
nty=1:na+nx;
xt(find(ntx>nb))=x;
for k=1:nx,
   yt(k+na) = yt(k+na) + be*xt(find((ntx>=k)&(ntx<=nb+k)));
   if(na>0) yt(k+na) = yt(k+na) - ae*yt(find((nty>=k)&(nty<na+k))); end
   yt(k+na) = yt(k+na)/a(1);
end
y=yt(find(nty>na));




                          
 