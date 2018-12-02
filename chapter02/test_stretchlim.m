% f = [1 2 3; 4 5 6; 7 8 9];
% if f is too small like this, low_high will be [1 9].
f = rand(32, 8);

amin = min(f(:));
amax = max(f(:));
low_high = stretchlim(f);
low_high2 = stretchlim(f, [0 1]);

% this is not permitted.
% low_high3 = stretchlim(f, []);