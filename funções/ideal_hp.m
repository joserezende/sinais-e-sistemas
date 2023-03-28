function hd = ideal_hp(wc,M);
% Ideal High Pass filter computation
% --------------------------------
% [hd] = ideal_hp(wc,M)
%  hd = ideal impulse response between 0 to M-1
%  wc = cutoff frequency in radians
%   M = length of the ideal filter
%
alpha = (M-1)/2;
n = [0:1:(M-1)];
m = n - alpha + eps;
hd = sinc(m) - sin(wc*m) ./ (pi*m);
