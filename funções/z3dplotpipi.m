function z3dplotpipi3(b,a)
% Plota em 3D a Transformada Z racional B(z)/A(z) e B(z=exp(jw))/A(z=exp(jw)) , w de -pi a pi
% -----------------------------------------------------------------------------------------
%       z3dplotpipi3(b,a)
%
%   b: coeficientes do numerador em ordem crescente de potencias negativas de z (começando de z^0)
%   a: coeficientes do denominador em ordem crescente de potencias negativas de z (começando de z^0)
%
%	Copyright (C) Francisco Fraga 2002
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
magze = abs(ze)
magpo = abs(po)
pause;
figure;
zplane(b,a);
title('Diagrama de pólos e zeros');
pause;
if isempty(ze)
   ze2 = 0;
else
   ze2 = ze;
end   
if isempty(po)
   po2 = 0;
else
   po2 = po;
end   
zmax=1.5*max(max(abs(ze2)),max(abs(po2))) 
if(zmax<1.5) zmax=1.5; end
rz=-zmax:zmax/50+eps:zmax;
iz=rz;
figure;
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
figure;
w=-pi:pi/2048:pi;
[H]=freqz(b,a,w);
plothw(w,H,'r');
pause;
figure;
freqz(b,a,w);







