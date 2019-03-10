% Problem 1
max(A, B, C) :-
  A =< B,
  C is B.
max(A, B, C) :-
  A > B,
  C is A.

max3numbers(X, Y, Z) :-
  max(X, Y, A),
  max(A, Z, B),
  write(B),nl.

% Problem 2
mypromise(0) :- write('').
mypromise(N) :-
  N > 0,
  write('I will study hard for the midterm.'),nl,
  M is (N - 1),
  mypromise(M).

% Problem 3
factorial(0, 1).
factorial(1, 1).
factorial(N, F) :-
  N > 1,
  A is (N - 1),
  factorial(A, B),
  F is (B * N).

% Problem 4
sumcube(0, 0).
sumcube(1, 1).
sumcube(N, S) :-
  N > 1,
  A is (N - 1),
  sumcube(A, B),
  S is (B + (N ^ 3)).

% Problem 5
directTrain(forbach, saarbruecken).
directTrain(freyming, forbach).
directTrain(fahlquemont, stAvold).
directTrain(stAvold, forbach).
directTrain(saarbruecken, dudweiler).
directTrain(metz, fahlquemont).
directTrain(nancy,metz).

travelBetween(X, Y) :- X == Y.
travelBetween(X, Y) :- directTrain(X, Y).
travelBetween(X, Y) :- directTrain(X, Z), travelBetween(Z, Y).
travelBetween(X, Y) :- directTrain(Y, X).
travelBetween(X, Y) :- directTrain(Y, Z), travelBetween(Z, X).

