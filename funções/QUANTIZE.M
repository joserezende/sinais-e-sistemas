function [yq] = quantize(y,B)
% Quantiza matriz ou vetor y com B bits de precisão
% -------------------------------------------------
% [yq] = quantize(y,B)
%
swing = (2^B-1)/2;
yq = (round(y*swing+swing) - swing)/swing;