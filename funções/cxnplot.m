function [x,n] = cxnplot(x,n)
% Plota x(n) como uma sequencia complexa
% (parte real, parte imaginária, módulo e plano complexo)
% -------------------------------------------------------
% [x,n] = cxnplot(x,n)
%
subplot(2,2,1);
stem(n,real(x),'r');
%title('    Parte real');
xlabel('n'); ylabel('Re[x(n)]');
hold on
plot(n,zeros(size(x)),'k-');
hold off
subplot(2,2,2);
stem(n,imag(x),'b');
%title('    Parte imaginária'); 
xlabel('n'); ylabel('Im[x(n)]');
hold on
plot(n,zeros(size(x)),'k-');
hold off
subplot(2,2,3);
stem(n,abs(x),'g');
%title('    Módulo'); 
xlabel('n'); ylabel('|x(n)|');
subplot(2,2,4);
plot(real(x),imag(x),'k-^');
v = axis;
r = v(1):v(2);
i = v(3):v(4);
hold on;
plot(r,zeros(size(r)),'k-');
plot(zeros(size(i)),i,'k-');
hold off;
%title('    Plano complexo');
ylabel('Im[x(n)]'); xlabel('Re[x(n)]');
