function plotHw2(w,H,cor)
%Plota magnitude e fase da resposta em frequencia de um sistema discreto H(exp(jw))
%----------------------------------------------------------------------------------
%  plotHw2(w,H,cor)
%     w: vetor frequencia digital 
%     H: vetor da resposta em frequencia
%     cor: cor do traço a ser plotado
%
magH = abs(H); angH = angle(H)/pi;
subplot(2,1,1); 
plot(w/pi,magH,cor); grid
hold on
plot(w/pi,zeros(size(H)),'k-');
%axis([w(1)/pi w(length(w))/pi min(magH)-(max(magH)/5.0) max(magH)+(max(magH)/5.0)]);
xlabel('frequencia em unidades de pi');
title('Magnitude de H(exp(jw))'); ylabel('Magnitude')
subplot(2,1,2);
plot(w/pi,angH,cor); grid
hold on
plot(w/pi,zeros(size(H)),'k-');
%axis([w(1)/pi w(length(w))/pi min(angH)-(abs(max(angH))/5.0) max(angH)+(abs(max(angH))/5.0)]);
xlabel('frequencia em unidades de pi'); title('Fase de H(exp(jw))'); ylabel('pi radianos')
grid

