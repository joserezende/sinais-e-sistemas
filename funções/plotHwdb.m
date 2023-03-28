function plotHwdB(w,H,cor)
%Plota magnitude (em dB) e fase (em graus) da resposta em frequencia de um sistema discreto H(exp(jw))
%--------------------------------------------------------------------------------------------
%  plotHwdB(w,H,cor)
%     w: vetor frequencia digital 
%     H: vetor da resposta em frequencia
%     cor: cor do traço a ser plotado
%
magH = 20*log10(abs(H));
angH = 180*angle(H)/pi;
subplot(2,1,1); plot(w/pi,magH,cor); grid
axis([w(1)/pi w(length(w))/pi max(magH)-100 max(magH)+10]);
xlabel('frequencia em unidades de pi'); title('Magnitude de H(exp(jw))'); ylabel('Magnitude (dB)')
subplot(2,1,2); plot(w/pi,angH,cor); grid
hold on
plot(w,zeros(size(H)),'k-');grid
axis([w(1)/pi w(length(w))/pi min(angH)-(abs(max(angH))/5.0) max(angH)+(abs(max(angH))/5.0)]);
xlabel('frequencia em unidades de pi'); title('Fase de H(exp(jw))'); ylabel('Fase (graus)')
grid

