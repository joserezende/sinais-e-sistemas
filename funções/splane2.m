function splane(ze,po)
%  SPLANE s-plane zero-pole plot.
%   SPLANE(Z,P) plots the zeros Z and poles P (in column vectors) of a 
%   Laplace-transform (transfer function, s-domain). Each zero is represented
%   with a 'o' and each pole with a 'x' on the plot. Unlike function ZPLANE,
%   multiple zeros and poles are not indicated by the multiplicity number.
% 
%	Copyright (C) Francisco Fraga 2002
%
close all;
ze = sort(ze);
po = sort(po);
if (~isempty(ze))&(~isempty(po))
   imax = 2.5*max(max(imag(ze)),max(imag(po)));
	rmax = 2.5*max(max(real(ze)),max(real(po)));
	imin = 2.5*min(min(imag(ze)),min(imag(po)));
   rmin = 2.5*min(min(real(ze)),min(real(po)));
else
 if isempty(ze)
	imax = 2.5*max(imag(po));
	rmax = 2.5*max(real(po));
	imin = 2.5*min(imag(po));
   rmin = 2.5*min(real(po));
 else
	imax = 2.5*max(imag(ze));
	rmax = 2.5*max(real(ze));
	imin = 2.5*min(imag(ze));
   rmin = 2.5*min(real(ze));
 end  
end

if abs(rmax) > abs(rmin)
   rmin = -rmax;
else
   rmax = -rmin;
end
if abs(imax) > abs(imin)
   imin = -imax;
else
   imax = -imin;
end

if (rmax==rmin)
   rmin = imin;
   rmax = imax;
end
if (imax==imin)
   imin = rmin;
   imax = rmax;
   if isreal(ze)
      ze = ze + j*1e-30*ones(size(ze));
   end
   if isreal(po)
      po = po + j*1e-30*ones(size(po));
   end  
end

if ~isempty(ze)
   m = zeros(size(ze));
   plot(ze,'o','markersize',7); 
	if length(ze)>1
      for n = 1:length(ze)-1
         n = n + m(n);
         if n>=length(ze)
            break;
         end
      	if ze(n)==z(n+1)
         	m(n)=m(n)+1;
         	if length(ze)>n+1
            	for k=n+1:length(ze)-1
               	if ze(k)==z(k+1)
                  	m(n)=m(n)+1;
               	end
            	end
         	end
         end
      end
   end
   m = m + 1;
   plot(ze(find(m>1
end

hold on;
if ~isempty(po)
   plot(po,'x','markersize',8); 
end
axis([rmin rmax imin imax]);
plot(rmin:0.1:rmax,zeros(size(rmin:0.1:rmax)),'k');
plot(zeros(size(imin:0.1:imax)),imin:0.1:imax,'k');
xlabel('Re[s]');
ylabel('Im[s]');
title('Diagrama de pólos e zeros no plano complexo s');
hold off;

      
