fib(0, 1).
fib(1, 1).
fib(X, Y) :-
  X > 1, X1 is X - 1, X2 is X - 2, fib(X1, Z), fib(X2, W), Y is W + Z.
