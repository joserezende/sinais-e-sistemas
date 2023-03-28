function [b,a] = randLIT(M,N)
% 
% Cria um sistema LIT estável (coeficientes reais) com M zeros N pólos aleatórios
% -------------------------------------------------------------------------------
% 
%   [b,a] = randLIT(M,N)
%
%      b: vetor de coeficientes (reais) do numerador
%      a: vetor de coeficientes (reais) do denominador
%
if ((M~=fix(M))|(N~=fix(N)))
   error('M e N devem ser inteiros!');
end

M2 = fix(M/2);
if (rem(M,2)~=0)
   ze1 = 3*rand(1,1)*0.99 - 1.5; % zero real com magnitude < 1.5
   zer = 3*rand(M2,1)*0.99 - 1.5;
   maxzei = sqrt(1.5^2 - zer.^2);
   zei = 2*(maxzei.*rand(M2,1))*0.99 - maxzei;
   ze = zer + j*zei;  
   ze = [ze1;ze;conj(ze)] % zeros com magnitude < 1.5
else
   zer = 3*rand(M2,1)*0.99 - 1.5;
   maxzei = sqrt(1.5^2 - zer.^2);
   zei = 2*(maxzei.*rand(M2,1))*0.99 - maxzei;
   ze = zer + j*zei;  
   ze = [ze;conj(ze)] % zeros com magnitude < 1.5
end

N2 = fix(N/2);
if (rem(N,2)~=0)
   po1 = 2*rand(1,1)*0.99 - 1; % polo real com magnitude < 1
   por = 2*rand(N2,1)*0.99 - 1;
   maxpoi = sqrt(1 - por.^2);
   poi = 2*(maxpoi.*rand(N2,1))*0.99 - maxpoi;
   po = por + j*poi;  
   po = [po1;po;conj(po)]  % pólos dentro do círculo unitário
else
   por = 2*rand(N2,1)*0.99 - 1;
   maxpoi = sqrt(1 - por.^2);
   poi = 2*(maxpoi.*rand(N2,1))*0.99 - maxpoi;
   po = por + j*poi;  
   po = [po;conj(po)]      % pólos dentro do círculo unitário
end

subplot(1,1,1);
zplane(ze,po);
hold on;
title('Pólos e Zeros do Sistema LIT');
disp('Pressione ENTER para continuar');
pause;
bp = poly(ze');
ap = poly(po');
% bp: vetor b para potencias positivas de z
% ap: vetor a para potencias positivas de z
if(N>=M) 
   b=[zeros(1,N-M) bp];
   a=ap;
else
   b=bp;
   a=[zeros(1,M-N) ap];
end
[H,w]=freqz(b,a);
plothw(w,H,'r');
