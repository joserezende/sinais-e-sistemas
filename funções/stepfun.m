function [x,t] = stepfun(t0,t1,t2,Ts)
% Generates x(t) = u(t-t0); t1 <= t <= t2 step Ts
% -----------------------------------------------
% [x,t] = stepfun(t0,t1,t2, Ts)
%
t = t1:Ts:t2; x = (t-t0) >= 0;
