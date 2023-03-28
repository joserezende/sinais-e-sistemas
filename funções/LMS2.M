function [h,nh,y,flag,niter] = lms2(x,d,delta,N,epsilon)
% Algoritmo LMS
% ------------------------------
% [h,nh,y,flag,niter] = lms2(x,d,delta,N)
%
%     x = sinal digital na entrada do filtro
%     d = sinal de saída desejado
%     delta = degrau para ajuste dos coeficientes 
%     N = ordem do filtro
%		epsilon = critério de convergência (em geral < que 1e-3)
%
%     h = coeficientes do filtro a ser estimado (adaptativo)
%		nh = base de tempo de h (vetor linha)
%     y = sinal digital na saída do filtro
%  	flag = sinaliza erro (flag = 0: OK, convergiu; flag = 1: ERRO, NÃO CONVERGIU)
%		niter = número de iterações realmente efetivadas

flag2=0;
M = length(x); y = zeros(1,M);
h = zeros(1,N);
nh=0:length(h)-1;
h(1)=1E-10;
en = [ones(1,N)./10 zeros(1,M-N)];
emq = zeros(1,M);
for n = N:M,
   x1 = x(n:-1:n-N+1);
   y(n) = h * x1';
   e = d(n) - y(n);
   en(n+1)=e;
   emq(n-N+1)=(en(n-N+1:1:n)*(en(n-N+1:1:n))')./N;;
   h = h + delta*e*x1;
   if abs(emq(n-N+2)-emq(n-N+1)) < epsilon
      flag2=1;
   end
end
if flag2==0
   flag=1;
   niter=M;
end
if flag2==1
   niter=n-N;
   flag=0;
end
figure;
clf;
subplot(2,1,1);
plot(1:length(en)-N,en(N+1:length(en)));
title('SINAL DE ERRO');
xlabel('n');
ylabel('e(n) = d(n) - y(n)');
subplot(2,1,2);
plot(0:length(emq)-N,emq(N:length(emq)));
title('CONVERGÊNCIA DO ERRO MÉDIO QUADRÁTICO');
xlabel('número de iterações');
ylabel('erro médio quadrático');
