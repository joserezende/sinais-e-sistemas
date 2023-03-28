function [b,a] = randIIR3(M,N)
% 
% Cria um Filtro IIR estável (coeficientes reais) com M zeros N pólos aleatórios
% ------------------------------------------------------------------------------
% OBS.: O filtro é normalizado (max(H(exp(jw))=1)
%
%   [b,a] = randIIR3(M,N)
%
%      b: vetor de coeficientes (reais) do numerador
%      a: vetor de coeficientes (reais) do denominador
%
if ((M~=fix(M))|(N~=fix(N)))
   error('M e N devem ser inteiros!');
end

M2 = fix(M/2);
if (rem(M,2)~=0)
   ze1 = 2.4*rand(1,1) - 1.2; % zero real com magnitude <= 1.2
   zer = 2.4*rand(M2,1) - 1.2;
   maxzei = sqrt(1.2^2 - zer.^2);
   zei = 2*(maxzei.*rand(M2,1)) - maxzei;
   ze = zer + j*zei;  
   ze = [ze1;ze;conj(ze)] % zeros com magnitude <= 1.2
else
   zer = 2.4*rand(M2,1) - 1.2;
   maxzei = sqrt(1.2^2 - zer.^2);
   zei = 2*(maxzei.*rand(M2,1)) - maxzei;
   ze = zer + j*zei;  
   ze = [ze;conj(ze)] % zeros com magnitude <= 1.2
end

N2 = fix(N/2);
if (rem(N,2)~=0)
   po1 = 0.3*rand(1,1) + 0.69; % polo real com magnitude < 1
   por = 0.3*rand(N2,1) + 0.69;
   maxpoi = sqrt(0.99^2 - por.^2);
   poi = 2*(maxpoi.*rand(N2,1)) - maxpoi;
   po = por + j*poi;  
   po = [po1;po;conj(po)]  % pólos com magnitude < 1
else
   por = 0.3*rand(N2,1) + 0.69;
   maxpoi = sqrt(0.99^2 - por.^2);
   poi = 2*(maxpoi.*rand(N2,1)) - maxpoi;
   po = por + j*poi;  
   po = [po;conj(po)]      % pólos com magnitude < 1
end

subplot(1,1,1);
zplane(ze,po);
hold on;
title('Pólos e Zeros do Filtro IIR');
disp('Pressione ENTER para continuar');
pause;

b = poly(ze');
a = poly(po');
[H,w] = freqz(b,a);
b0 = 1/max(abs(H));     % ganho para normalizar a resposta em frequencia
b = b0*b;

