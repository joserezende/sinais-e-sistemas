function plotsHwdb(w,H,cor)
%Plota magnitude (em dB) e fase (em graus) da resposta em frequencia de um sistema continuo H(jw)
%------------------------------------------------------------------------------------------------
%  plotsHwdb(w,H,cor)
%     w: vetor frequencia angular (em radianos por segundo) 
%     H: vetor da resposta em frequencia
%     cor: cor do traço a ser plotado
%
hold on
magH = 20*log10(abs(H));
angH = 180*angle(H)/pi;
subplot(2,1,1);
plot(w/(2*pi),magH,cor); 
grid
hold on
axis([w(1)/(2*pi) w(length(w))/(2*pi) max(magH)-100 max(magH)+10]);
xlabel('frequencia (Hz)'); title('Magnitude de H(jw)'); ylabel('Magnitude (dB)')
subplot(2,1,2);
plot(w/(2*pi),angH,cor);
grid
hold on
plot(w/(2*pi),zeros(size(w)),'k-');
axis([w(1)/(2*pi) w(length(w))/(2*pi) min(angH)-(abs(max(angH))/5.0) max(angH)+(abs(max(angH))/5.0)]);
xlabel('frequencia (Hz)'); title('Fase de H(jw)'); ylabel('graus')

