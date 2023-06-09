function [h,y,e] = lms(x,d,delta,N)
% LMS Algorithm for Coefficient Adjustment
% ----------------------------------------
% [h,y] = lms(x,d,delta,N)
%     h = estimated FIR filter
%     y = output array y(n)
%     x = input array x(n)
%     d = desired array d(n), length must be same as x
% delta = step size
%     N = length of the FIR filter
%
M = length(x);
y = zeros(1,M);
h = zeros(1,N);
e = zeros(1,M);
for n = N:M
    x1 = x(n:-1:n-N+1);
     y(n) = h * x1';
     e(n) = d(n) - y(n);
     h = h + delta*e(n)*x1;
     %disp('h: ');
     %disp(h);
     %pause;
     %disp('e(n): ');
     %disp(e(n));
     %pause;
end
%y=conv(...