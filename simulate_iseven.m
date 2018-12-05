function E = simulate_iseven(A)
%SIMULATE_ISEVEN Determines which elements of an array are even numbers.
% E = SIMULATE_ISEVEN(A) returns a logical array, E, of the same size as A,
% with 1s (TRUE) in the locations corresponding to even numbers
% (i.e., . . . -4, -1, 0, 2, 4, . . . ) in A, and 0s (FALSE) elsewhere.
% A must be a numeric array.
if ~isnumeric(A)
    error('A should be numeric.');
end
B = simulate_isinteger(A) .* A;
E = (rem(B, 2) == 0) & B;