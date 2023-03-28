function [h] = fpbkaiser(wp,wr,Ar)
% filtro FIR passa baixas usando janela Kaiser

%wp = 0.425*pi; wr= 0.575*pi; Ar = 60;
btrans = wr - wp;
M = ceil((Ar-7.95)/(14.36*btrans/(2*pi))+1) + 1
n=[0:1:M-1];
beta = 0.1102*(Ar-8.7);
wc = (wr+wp)/2;
hd = ideal_lp(wc,M);
w_kai = (kaiser(M,beta))';
h = hd .* w_kai;
[db,mag,pha,grd,w] = freqz_m(h,[1]);
delta_w = 2*pi/1000;
%Rp = -(min(db(1:1:wp/delta_w+1)))        % Ripple na banda de passagem
%Ar = -round(max(db(wr/delta_w+1:1:501))) % Ar real
%pause;
% plots
subplot(1,1,1)
subplot(2,2,1); stem(n,hd); title('Resposta impulsiva do filtro ideal')
hold on;
plot(n,zeros(1,length(n)),'k');
axis([0 M-1 1.2*min(hd) 1.2*max(hd)]);
xlabel('n'); ylabel('hd(n)')
subplot(2,2,2); stem(n,w_kai);title('Janela Kaiser')
axis([0 M-1 0 1.1]); 
xlabel('n'); ylabel('w(n)')
subplot(2,2,3); stem(n,h);title('Resposta impulsiva real')
hold on;
plot(n,zeros(1,length(n)),'k');
axis([0 M-1 1.2*min(h) 1.2*max(h)]);
xlabel('n'); ylabel('h(n)')
subplot(2,2,4); plot(w/pi,db);title('Resposta em frequencia');grid
axis([0 1 -100 10]); xlabel('frequencia em unidades de pi'); ylabel('Decibéis')
set(gca,'XTickMode','manual','XTick',[0,wp/pi,wr/pi,1])
set(gca,'YTickMode','manual','YTick',[-Ar,0])
%set(gca,'YTickLabelMode','manual','YTickLabel',['60';' 0'])
