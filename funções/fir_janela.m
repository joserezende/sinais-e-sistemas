function [HdB,H] = fir_janela(w,wc,FilterType)
% 
%
M=length(w);
if FilterType == 'LP'
    hd=ideal_lp(wc,M);
else
    hd=ideal_hp(wc,M);
end
h=hd.*w';
[HdB,H]=freqz(h,[1]);
