% filtros digitais passa-baixa do tipo Chebyshev II (IIR)

Rp = 0.5; % m�ximo ripple na banda de passagem (dB)
Rs = 50; % m�nima atenua��o na banda de rejei��o (dB)

wp1 = 0.25; % freq. de fim da banda de passagem (em unidades de pi)
ws1 = 0.5; % freq. de in�cio da banda de rejei��o (em unidades de pi)
[N, Wn] = cheb2ord(wp1, ws1, Rp, Rs); 
[b1,a1] = cheby2(N,Rs,Wn);
% xf1 = filter(b1,a1,x);

wp2 = 0.5; % em unidades de pi
ws2 = 0.75; % em unidades de pi
[N, Wn] = cheb2ord(wp2, ws2, Rp, Rs); 
[b2,a2] = cheby2(N,Rs,Wn);
% xf2 = filter(b2,a2,x);



