function x = ifft_dt_butt(X,Nmin)
% 
% DECIMATION-IN-TIME IFFT BUTTERFLY ALGORITHM
%
%	   	ifft_dt_butt(X,Nmin)
%
%	X: input data (real or complex) column vector 
%	x: output FFT (complex) column vector 
%  Nmin: minimum desired number of IFFT points 
%
%  Reference: "Digital Signal Processing", Oppenheim & Schafer, PRENTICE HALL, 1975.
%					Section 9.3 (Decimation-in-Time FFT Algorithms), pp. 635-643)
%
%	Leonardo Campos Smanio & Francisco Fraga, INATEL, 2004
%   E-mail: fraga@inatel.br
%           leonardo-campos@inatel.br

% testing input data..
if size(X,2)~=1  
   error('input data is not a column vector!');
end   
if Nmin < length(X)
   warning('Nmin < length(x): time-domain aliasing will probably occur...');
end

N = 2^ceil(log2(Nmin));
if N < 2
   error('Nmin < 2!');
end   

% constants initialization:
WN = exp(-j*2*pi/N); % complex exponencial factor
rv = [0:N/2-1]';
WNr = WN.^rv; % butterfly multiplication factors
x = zeros(N,1);
x(1:length(X)) = X; % zero-padding

% sorting input data in bit-reversed order:
N2 = N/2;
ipos = 0;
for pos = 0:N-2,
   if pos < ipos
      temp = x(ipos+1); 
      x(ipos+1) = x(pos+1);
      x(pos+1) = temp;
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
      
      % butterfly multiplication 
      WNrX = WNr(r+1).*x(q+1); 
      
      % In-place butterfly computations:
      x(q+1) = x(p+1);
      x(p+1) = x(p+1) + WNrX;
      x(q+1) = x(q+1) - WNrX;
   end
end

% Factor 1/N Multiplication
x=x/N;
