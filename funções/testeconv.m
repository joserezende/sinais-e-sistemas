clear all
close all
t=-20:20;

t1=0:80;

x=degrau(0,-20,20) - degrau(10,-20,20);
figure;stem(t,x);

y=degrau(10,-20,20) - degrau(20,-20,20);
figure;stem(t,y);

[y,ny] = convmod(x,t,y,t);
figure;
stem(ny,y);