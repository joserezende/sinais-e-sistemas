function epsilon2 = Ha2cheby1(N,Rp)
%------------------------------------------------------------------------------
%      epsilon2 = Ha2cheby1(N,Rp)
%------------------------------------------------------------------------------
% Plota resposta de magnitude quadrática de um filtro passa-baixas normalisado
% de ordem N do tipo Chebyshev-I com Rp decibéis de ripple na banda de passagem
%
x=0:0.001:3;
if x<=1
   TN=cos(N*acos(x));
else
   TN=cosh(N*acosh(x));
end
epsilon2 = 10^(.1*Rp)-1;
Ha2 = 1./(1 + epsilon2*(TN.^2));
subplot(2,1,1);
hold on;
plot(x,Ha2);
axis([0 3 0 1+epsilon2]);
xlabel('frequencia normalizada x');
ylabel('Ha2(x)');
title('Resposta de magnitude quadrática');
subplot(2,1,2);
hold on;
plot(x,10*log10(Ha2),'r');
xlabel('frequencia normalizada x');
ylabel('Ha2(x) em decibéis');
title('Resposta de magnitude quadrática');
axis([0 3 -15*N 15*Rp]);


