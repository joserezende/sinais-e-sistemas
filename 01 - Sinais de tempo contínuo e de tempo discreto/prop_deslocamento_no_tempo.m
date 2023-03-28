% Deslocamento de uma função no tempo contínuo

clc
clear
close all

% Função exponencial decrescente, de tempo contínuo,
% com valores diferentes de zero para t >= 0
T = 50;
t1 = -T:1/10:0;
x1 = zeros(1,length(t1));
t2 = 0:1/10:T;
x2 = 0.9.^t2;

% Sinal no domínio do tempo x(t)=0.9^t <> 0 para t >= 0
t = [t1(1:end-1) t2];
x = [x1(1:end-1) x2];

% Atrasado 10 segundos
[y,ty] = deslocar(x,t,10);

% Adiantado 10 segundos
[v,tv] = deslocar(x,t,-10);

subplot(311)
plot(t,x,'LineWidth',2)
xlabel('tempo t, em segundos')
ylabel('amplitude')
title('x(t) = 0,9^t \neq 0 \forall t \geq 0')
ax = gca;
ax.FontSize = 16;
grid

pause

subplot(312)
plot(ty,y,'LineWidth',2)
xlabel('tempo t, em segundos')
ylabel('amplitude')
title('y(t) = x(t-10)')
axis([-T T 0 1])
ax = gca;
ax.FontSize = 16;
grid

pause

subplot(313)
plot(tv,v,'LineWidth',2)
xlabel('tempo t, em segundos')
ylabel('amplitude')
title('v(t) = x(t+10)')
axis([-T T 0 1])
ax = gca;
ax.FontSize = 16;
grid

pause

% Deslocamento de uma função no tempo contínuo

% Função exponencial decrescente, de tempo discreto,
% com valores diferentes de zero para n >= 0
[s,n] = stepseq(0,-50,50);
x = s.*0.9.^n;

% Atrasado 10 amostras
[g,tg] = deslocar(x,n,10);

% Adiantado 10 amostras
[h,th] = deslocar(x,n,-10);

% Plotagem dos gráficos
figure

subplot(311)
stem(n,x,'LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('x[n] = 0,9^n \neq 0 \forall n \geq 0')
ax = gca;
ax.FontSize = 16;
grid

pause

subplot(312)
stem(tg,g,'LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('g[n] = x[n-10]')
axis([-T T 0 1])
ax = gca;
ax.FontSize = 16;
grid

pause

subplot(313)
stem(th,h,'LineWidth',2)
xlabel('amostras')
ylabel('amplitude')
title('h(t) = x[n+10]')
axis([-T T 0 1])
ax = gca;
ax.FontSize = 16;
grid
