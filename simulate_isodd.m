function D = simulate_isodd(A)
%SIMULATE_ISODD Determines which elements of an array are odd numbers.
% E = SIMULATE_ISODD(A) returns a logical array, D, of the same size as A,
% with 1s (TRUE) in the locations corresponding  to odd numbers
% (i.e., . . . -3, -1, 1, 3, . . .) in A, and 0s (FALSE) elsewhere.
% A must be a numeric array.
if ~isnumeric(A)
    error('A should be numeric.');
end
B = simulate_isinteger(A) .* A;
D = (rem(B, 2) ~= 0) & B;