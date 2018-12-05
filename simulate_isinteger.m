function I = simulate_isinteger(A)
%SIMULATE_ISINTEGER Determines which elements of an array are integers.
% I = SIMULATE_ISINTEGER(A) returns logical array, I, of the same size
% as A, with 1s (TRUE) in the locations corresponding to integers
% (i .e., . . .  -2 -1 0 1 2 . . .) in A, and 0s (FALSE) elsewhere.
% A must be a numeric array.

if ~isnumeric(A)
    error('A should be numeric.');
end
I = ( (A - floor(A)) == 0 ) &  (imag(A) == 0);