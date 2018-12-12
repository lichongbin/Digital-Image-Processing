f = [1 2 3; 4 5 6; 7 8 9];
% f is a matrix like this:
%  1     2     3
%  4     5     6
%  7     8     9

% mat2gray transforms f to g
g = mat2gray(f);
% g
%      0    0.1250    0.2500
% 0.3750    0.5000    0.6250
% 0.7500    0.8750    1.0000

% I implement the same function as mat2gray in simulate_mat2gray.
simulate_g = simulate_mat2gray(f);
% simulate_g
%      0    0.1250    0.2500
% 0.3750    0.5000    0.6250
% 0.7500    0.8750    1.0000

% im2uint8 can't revert g to f.
s = im2uint8(g);
% s
% 0   32   64
% 96  128  159
% 191  223  255

% maybe this is what you want if you want revert it back to f.
g2 = mat2gray(f, [0 255]);
% g2
% 0.0039    0.0078    0.0118
% 0.0157    0.0196    0.0235
% 0.0275    0.0314    0.0353

s2 = im2uint8(g2);
% s2
% 1    2    3
% 4    5    6
% 7    8    9