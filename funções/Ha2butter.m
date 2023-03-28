function Ha2butter(N)
%------------------------------------------------------------------------------
%      Ha2butter(N)
%------------------------------------------------------------------------------
% Plota resposta de magnitude quadrática de um filtro passa-baixas normalizado
% de ordem N do tipo Butterwoth
%
x=0:0.001:3;
Ha2 = 1./(1 + x.^(2*N));
subplot(2,1,1);
hold on;
plot(x,Ha2);
axis([0 3 0 1.2]);
xlabel('frequencia normalizada x');
ylabel('Ha2(x)');
title('Resposta de magnitude quadrática');
subplot(2,1,2);
hold on;
plot(x,10*log10(Ha2),'r');
xlabel('frequencia normalizada x');
ylabel('Ha2(x) em decibéis');
title('Resposta de magnitude quadrática');
axis([0 3 -15*N 1]);


