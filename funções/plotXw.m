function plotXw(w,X,cor)
%Plota magnitude e fase da Transformada de Fourier de Tempo Discreto (TFTD)
%--------------------------------------------------------------------------
%  plotXw(w,X,cor)
%     w: vetor frequencia digital 
%     X: vetor TFTD
%     cor: cor do traço a ser plotado
%
magX = abs(X); angX = angle(X)/pi;
subplot(2,1,1); plot(w/pi,magX,cor); grid
hold on
plot(w,zeros(size(X)),'k-');
axis([w(1)/pi w(length(w))/pi min(magX)-(max(magX)/5.0) max(magX)+(max(magX)/5.0)]);
xlabel('frequencia em unidades de pi'); title('Magnitude de X(exp(jw))'); ylabel('Magnitude')
subplot(2,1,2); plot(w/pi,angX,cor); grid
hold on
plot(w,zeros(size(X)),'k-');
axis([w(1)/pi w(length(w))/pi min(angX)-(abs(max(angX))/5.0) max(angX)+(abs(max(angX))/5.0)]);
xlabel('frequencia em unidades de pi'); title('Fase de X(exp(jw))'); 
ylabel('Fase (em unidades de pi radianos)')
