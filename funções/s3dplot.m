function s3dplot(b,a)
% Plota em 3D a Transformada de Laplace racional B(s)/A(s) e B(s=jw)/A(s=jw)
% ---------------------------------------------------------------------------
%       s3dplot(b,a)
%
%   b: coeficientes do numerador em ordem decrescente de potencias positivas de s
%   a: coeficientes do denominador em ordem decrescente de potencias positivas de s
%
%	Copyright (C) Francisco Fraga 2002
%
M=length(b);
N=length(a);
ze=roots(b)
po=roots(a)
pause;
figure(1);
subplot(1,1,1);
smax = splane(ze,po);
pause;
rs=-smax:smax/50+eps:smax;
is=rs;
figure(2);
subplot(1,1,1);
[X,Y]=meshgrid(rs,is);
s=X+Y*j;
Bs=b(M);
for k=1:M-1, 
   Bs=Bs+b(k)*(s.^(M-k));
end
As=a(N);
for k=1:N-1,
   As=As+a(k)*(s.^(N-k));
end
H=abs(Bs./As);
mesh(X,Y,H);
xlabel('Re(s)');
ylabel('Im(s)');
zlabel('Magnitude da Transformada de Laplace');
g=2;
while ~isempty(g),
   axis([-smax smax -smax smax 0 g]);
   g=input('Digite outro valor para Magnitude máxima da Transformada de Laplace (ENTER para sair): ');
end
% Corte para mostrar a resposta em frequencia A(s=jw)/B(s=jw)
Hjw=(X<=0);
Hjw=Hjw.*H;
mesh(X,Y,Hjw);
xlabel('Re(s)');
ylabel('Im(s)');
zlabel('Magnitude para s=jw');
g=2;
while ~isempty(g),
   axis([-smax smax -smax smax 0 g]);
   g=input('Digite outro valor para Magnitude máxima da Resp. Freq. (ENTER para sair): ');
end
f=-1;
hold off;
while ~isempty(f),
  if f==-1; 
   figure(3);
   [H,w]=freqs(b,a);
   plotshw(w,H,'r');
   figure(4);
   freqs(b,a);
   figure(5);
   plotshwdb(w,H,'m');
  else
   figure(3);
   H=freqs(b,a,w);
   plotshw(w,H,'r');
   figure(4);
   freqs(b,a,w);
   figure(5);
   plotshwdb(w,H,'m');
  end
  f=input('Digite outro valor a máxima freqüência (em hertz) a ser mostrada na Resp. Freq. (ENTER para sair): ');
  if isempty(f)
     break;
  end
  w = 0:2*pi*f/1000:2*pi*f;
end

disp('PRESSIONE ENTER PARA FECHAR TODAS AS FIGURAS!!!');
pause;
close all;









