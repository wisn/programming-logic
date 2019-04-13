% Problem 1 [DONE]
addone([], []).
addone([H|T], Ans) :-
  number(H),
  X is (H + 1),
  addone(T, L),
  Ans = [X|L].
addone(Ans, [H|T]) :-
  number(H),
  X is (H - 1),
  addone(L, T),
  Ans = [X|L].

% Problem 2 [DONE]
sameElemList([]).
sameElemList([H|T]) :- sameElemList_helper(H, T).

sameElemList_helper(_, []).
sameElemList_helper(X, [H|T]) :-
  X == H,
  sameElemList_helper(X, T).

% Problem 3 [DONE]
scalarMult(X, [H|[]], Ans) :-
  var(Ans),
  Y is (X * H),
  append([Y], [], Ans).
scalarMult(X, [H|T], Ans) :-
  var(Ans),
  Y is (H * X),
  scalarMult(X, T, L),
  append([Y], L, Ans).
scalarMult(X, Ans, [H|[]]) :-
  var(Ans),
  Y is (H / X),
  append([Y], [], Ans).
scalarMult(X, Ans, [H|T]) :-
  var(Ans),
  Y is (H / X),
  scalarMult(X, L, T),
  append([Y], L, Ans).
scalarMult(Ans, L1, L2) :-
  var(Ans),
  scalarMult_helper(L1, L2, L),
  sameElemList(L),
  [H|_] = L,
  Ans is H.

scalarMult_helper([H1|[]], [H2|[]], L) :-
  X is (H2 / H1),
  append([X], [], L).
scalarMult_helper([H1|T1], [H2|T2], L) :-
  X is (H2 / H1),
  scalarMult_helper(T1, T2, Y),
  append([X], Y, L).

% Problem 4 [DONE]
add(P, Q, X) :-
  var(X),
  length(P, A),
  length(Q, B),
  A == B,
  add_helper1(P, Q, X).
add(P, Q, X) :-
  var(X),
  length(P, A),
  length(Q, B),
  A \== B,
  X = 'dimension error'.
add(P, X, Q) :-
  var(X),
  length(P, A),
  length(Q, B),
  A == B,
  add_helper2(P, X, Q).
add(P, X, Q) :-
  var(X),
  length(P, A),
  length(Q, B),
  A \== B,
  X = 'dimension error'.
add(X, P, Q) :-
  var(X),
  length(P, A),
  length(Q, B),
  A == B,
  add_helper3(X, P, Q).
add(X, P, Q) :-
  var(X),
  length(P, A),
  length(Q, B),
  A \== B,
  X = 'dimension error'.

add_helper1([H1|[]], [H2|[]], Ans) :-
  var(Ans),
  X is (H1 + H2),
  append([X], [], Ans).
add_helper1([H1|T1], [H2|T2], Ans) :-
  var(Ans),
  X is (H1 + H2),
  add_helper1(T1, T2, Y),
  append([X], Y, Ans).
add_helper2([H1|[]], Ans, [H2|[]]) :-
  var(Ans),
  X is (H2 - H1),
  append([X], [], Ans).
add_helper2([H1|T1], Ans, [H2|T2]) :-
  var(Ans),
  X is (H2 - H1),
  add_helper2(T1, Y, T2),
  append([X], Y, Ans).
add_helper3(Ans, [H1|[]], [H2|[]]) :-
  var(Ans),
  X is (H2 - H1),
  append([X], [], Ans).
add_helper3(Ans, [H1|T1], [H2|T2]) :-
  var(Ans),
  X is (H2 - H1),
  add_helper3(Y, T1, T2),
  append([X], Y, Ans).


% Problem 5 [DONE]
dot(P, Q, Ans) :-
  var(Ans),
  length(P, A),
  length(Q, B),
  A == B,
  dot_helper(P, Q, Ans).
dot(P, Q, Ans) :-
  var(Ans),
  length(P, A),
  length(Q, B),
  A \== B,
  Ans = 'dimension error'.

dot_helper([H1|[]], [H2|[]], Ans) :-
  Ans is (H1 * H2).
dot_helper([H1|T1], [H2|T2], Ans) :-
  X is (H1 * H2),
  dot_helper(T1, T2, Y),
  Ans is (X + Y).

