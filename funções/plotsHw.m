function plotsHw(w,H,cor)
%Plota magnitude e fase (em unidades de pi) da resposta em frequencia de um sistema continuo H(jw)
%-------------------------------------------------------------------------------------------------
%  plotsHw(w,H,cor)
%     w: vetor frequencia angular (em radianos por segundo) 
%     H: vetor da resposta em frequencia
%     cor: cor do traço a ser plotado
%
hold on
magH = abs(H);
angH = angle(H)/pi;
subplot(2,1,1);
plot(w/(2*pi),magH,cor);
grid
hold on
plot(w/(2*pi),zeros(size(w)),'k-');
axis([w(1)/(2*pi) w(length(w))/(2*pi) min(magH)-(max(magH)/5.0) max(magH)+(max(magH)/5.0)]);
xlabel('frequencia (Hz)'); title('Magnitude de H(jw)'); ylabel('Magnitude')
subplot(2,1,2);
plot(w/(2*pi),angH,cor);
grid
hold on
plot(w/(2*pi),zeros(size(w)),'k-');
axis([w(1)/(2*pi) w(length(w))/(2*pi) min(angH)-(abs(max(angH))/5.0) max(angH)+(abs(max(angH))/5.0)]);
xlabel('frequencia (Hz)'); title('Fase de H(jw)'); ylabel('pi radianos')

