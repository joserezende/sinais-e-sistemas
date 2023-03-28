function x = sinc(n,T)
% Calcula x = sen(pi*n/T)/(pi*n/T)
% ------------------------------------
% x = sinc(n,T)
%
% n : vetor de tempo
% T : período
for k=1:length(n),
   if(n(k)==0) x(k)=1; else x(k)=sin(pi*n(k)/T)/(pi*n(k)/T); end
end


