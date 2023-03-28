function delta2 = Ha2cheby2(N,Ar)
%----------------------------------------------------------------------------------
%      delta2 = Ha2cheby2(N,Ar)
%----------------------------------------------------------------------------------
% Plota resposta de magnitude quadr�tica de um filtro passa-baixas normalisado
% de ordem N do tipo Chebyshev-II com Ar decib�is de atenua��o na banda de rejei��o
%
x=0.001:0.001:10;
xinv=1./x;
if xinv <=1
   TN=cos(N*acos(xinv));
else
   TN=cosh(N*acosh(xinv));
end
%TN = fliplr([TN1 TN2]);
A2 = 10^(.1*Ar);
delta2=1/A2;
Ha2 = 1./(1 + A2./(TN.^2));
subplot(2,1,1);
plot(x,Ha2);
axis([0 10 0 1.1]);
xlabel('frequencia normalizada x');
ylabel('Ha2(x)');
title('Resposta de magnitude quadr�tica');
subplot(2,1,2);
plot(x,10*log10(Ha2),'r');
xlabel('frequencia normalizada x');
ylabel('Ha2(x) em decib�is');
title('Resposta de magnitude quadr�tica');
axis([0 10 -4*Ar 3]);


