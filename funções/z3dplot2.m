function z3dplot2(b,a)
% Plota em 3D a Transformada Z racional B(z)/A(z) e B(z=exp(jw))/A(z=exp(jw))
% ---------------------------------------------------------------------------
%       z3dplot(b,a)
%
%   b: coeficientes do numerador em ordem crescente de potencias negativas de z
%   a: coeficientes do denominador em ordem crescente de potencias negativas de z
%
M=length(b)-1;
N=length(a)-1;
% bp: vetor b para potencias positivas de z
% ap: vetor a para potencias positivas de z
if(N>=M) 
   bp=[b zeros(1,N-M)]; ap=a;
else
   bp=b; ap=[a zeros(1,M-N)];
end
ze=roots(bp)
po=roots(ap)
pause;
subplot(1,1,1);
figure(5);
zplane(b,a);
title('Diagrama de pólos e zeros');
pause;
zmax=1.5*max(max(abs(ze)),max(abs(po))); 
if(zmax<1.5) zmax=1.5; end
rz=-zmax:zmax/50+eps:zmax;
iz=rz;
figure(6);
subplot(1,1,1);
[X,Y]=meshgrid(rz,iz);
z=X+Y*j;
Bz=b(1);
for k=1:M, 
   Bz=Bz+b(k+1)*(z.^-k);
end
Az=a(1);
for k=1:N,
   Az=Az+a(k+1)*(z.^-k);
end
H=abs(Bz./Az);
mesh(X,Y,H);
xlabel('Real(z)');
ylabel('Imag(z)');
zlabel('Magnitude da Transformada Z');
g=2;
while ~isempty(g),
   axis([-zmax zmax -zmax zmax 0 g]);
   g=input('Digite outro valor para Magnitude máxima da Transformada Z (ENTER para sair): ');
end
% Corte para mostrar a resposta em frequencia A(exp(jw))/B(exp(jw))
Hjw=(abs(X+j*Y)<=1);
Hjw=Hjw.*H;
mesh(X,Y,Hjw);
xlabel('Real(z)');
ylabel('Imag(z)');
zlabel('Magnitude para z=exp(jw)');
g=2;
while ~isempty(g),
   axis([-zmax zmax -zmax zmax 0 g]);
   g=input('Digite outro valor para Magnitude máxima da Resp. Freq. (ENTER para sair): ');
end
figure(7);
[H,w]=freqz(b,a);
plothw(w,H,'r');
pause;
figure(8);
freqz(b,a);
subplot(2,1,1);
axis([0 1 -80 10]);
disp('PRESSIONE ENTER PARA FECHAR TODAS AS FIGURAS!!!');
pause;
close all;







