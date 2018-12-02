function g = simulate_mat2gray(f)
% SIMULATE_MAT2GRAY Simulate the operation of mat2gray.
% It is just an experiment.
amin = min(f(:));
amax = max(f(:));
g = (f - amin) / (amax - amin);