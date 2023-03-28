function X = fft_dt_butt(x,Nmin)
% 
% DECIMATION-IN-TIME FFT BUTTERFLY ALGORITHM (Francisco Fraga, INATEL, 2004)
%
%	   	fft_dt_butt(x,Nmin)
%
%	x: input data (real or complex) column vector 
%	X: output FFT (complex) column vector 
%  Nmin: minimum desired number of FFT points 
%
%  Reference: "Discrete-Time Signal Processing", Oppenheim & Schafer, 2nd ed., PRENTICE HALL, 1999.
%					Section 9.3 (Decimation-in-Time FFT Algorithms, pp. 635-643)
%
if size(x,2)~=1  % testing input data..
   error('input data is not a column vector!');
end   
if Nmin < length(x)
   warning('Nmin < length(x): time-domain aliasing will probably occur...');
end

N = 2^ceil(log2(Nmin));
if N < 2
   error('Nmin < 2!');
end   

% constants initialization:
WN = exp(j*2*pi/N); % complex exponencial factor
rv = [0:N/2-1]';
WNr = WN.^rv; % butterfly multiplication factors
X = zeros(N,1);
X(1:length(x)) = x; % zero-padding

% sorting input data in bit-reversed order:
N2 = N/2;
ipos = 0;
for pos = 0:N-2,
   if pos < ipos
      temp = X(ipos+1); 
      X(ipos+1) = X(pos+1);
      X(pos+1) = temp;
   end
   Nk = N2;
   while ipos >= Nk
      ipos = ipos - Nk;
      Nk = Nk/2;
   end
   ipos = ipos + Nk;
end   

% FFT computations:
mf = log2(N) - 1;
for m = 0:mf,
   ddm = 2^(m+1);
   dm = 2^m;
   k = 1:dm;
   lf = N/ddm - 1;
   for l = 0:lf,
      p = k - 1 + ddm*l;
      q = p + dm;
      r = (k - 1).*2^(mf - m);
      WNrX = WNr(r+1).*X(q+1); % butterfly multiplication 
      % In-place butterfly computations:
      X(q+1) = X(p+1);
      X(p+1) = X(p+1) + WNrX;
      X(q+1) = X(q+1) - WNrX;
   end
end