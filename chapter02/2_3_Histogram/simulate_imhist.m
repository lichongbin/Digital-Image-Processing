function h = simulate_imhist(f)
%SIMULATE_IMHIST implements the same function as imhist.
% 
% 
if ~isa(f, 'uint8')
    error('Only the uint8 is supported.');
end

h = zeros(1, 256);
for i=1:256
    h(i) = sum(sum(f == i));
end