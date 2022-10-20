function Px = welch(x,L,overlap, window)
% window to hold the value: 1 = Rechtangular
%                           2 = Hamming
%                           3 = Hanning
%                           4 = Blackmen
if(nargin <=3)
    window =1;
end

if(nargin <=2)
    overlap =0;
end
if(nargin ==1)
    L =length(x);
end

if(overlap >= 1 || (overlap<0))
    error('Overlap is invalid')
end

n1 = 1;
n2 = L;
n0 = (1-overlap)*L;

numSubseq = 1 +floor((length(x) - L)/ n0);

Px = 0; % prior to the loop - we estimate the PSD to 0

for i =1:numSubseq
    Px = Px + 1;
    n1 = n1 +n0;
    n2 = n2 +n0;
end

end