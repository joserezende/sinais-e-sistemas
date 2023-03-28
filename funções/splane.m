function [smax] = splane(ze,po)
%  SPLANE s-plane zero-pole plot.
%   SPLANE(Z,P) plots the zeros Z and poles P (in column vectors) of a 
%   Laplace-transform (transfer function, s-domain). Each zero is represented
%   with a 'o' and each pole with a 'x' on the plot. Unlike function ZPLANE,
%   multiple zeros and poles are not indicated by the multiplicity number.
% 
%	Copyright (C) Francisco Fraga 2002
%
% close all;
zemax = 2.5*max(abs(ze));
pomax = 2.5*max(abs(po));
if isempty(zemax)
   zemax = 0;
end
if isempty(pomax)
   pomax = 0;
end
smax = max(zemax,pomax);
   if isreal(ze)
      ze = ze + j*1e-50*ones(size(ze));
   end
   if isreal(po)
      po = po + j*1e-50*ones(size(po));
   end  
if ~isempty(ze)
   plot(ze,'o','markersize',7); 
end
hold on;
if ~isempty(po)
   plot(po,'x','markersize',8); 
end
axis([-smax smax -smax smax]);
rmin = -smax;
rmax = smax;
imin = -smax;
imax = smax;
plot(rmin:0.1:rmax,zeros(size(rmin:0.1:rmax)),'k');
plot(zeros(size(imin:0.1:imax)),imin:0.1:imax,'k');
grid;
xlabel('Re[s]');
ylabel('Im[s]');
title('Diagrama de pólos e zeros no plano complexo s');
hold off;

