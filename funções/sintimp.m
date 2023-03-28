function sintimp(x,n)
% Plota x(n) e sua síntese por impulsos
% -------------------------------------
% sintimp(x,n)
%
% OBS: É necessário pressionar ENTER para plotar cada amostra
%
clf
xnsubplot2(x,n,1,'x(n)');
disp('Pressione ENTER para continuar');
pause;
y=zeros(size(n));
ni=n(1); nf=n(length(n)); d=1-ni;
for k=ni:nf,
   z=x(k+d)*impulso(k,ni,nf);
   y=y+z;
   xnsubplot2(y,n,2,'y(n)=x(n)');
   disp('Pressione ENTER para continuar');
   pause;
end

   
