% I/O Test
% Conslusion: Need to use `nl` for print out the buffer
animal(cat).
io_test :-
  write('please type animal name:'),
  nl,
  read(X),
  animal(X).

% Warming up
% Note: The `write` buffer is not printed out if there is no `nl` before `read`
parity :-
  write('Enter next number: '), read(N),
  parity_test(N, Type),
  write(N), write(' is '), write(Type), nl,
  (N =:= 9999; parity).

parity_test(N, Type) :-
  0 is N mod 2,
  Type = 'even',
  !.
parity_test(_, Type) :- Type = 'odd'.

% Remark 1
igc_startup :-
  write('Write a number between 0 - 100 (inclusive) '),
  write('or a string "end" without quotes:'),
  nl.
igc_io_error :-
  write('Input must be a number between 0 - 100 (inclusive) '),
  write('or a string "end" without quotes.'),
  nl.
igc :-
  igc_startup,
  read(N),
  (
    number(N), N >= 0, N =< 100 -> (
      igc_helper(N, Grade),
      write('The index is '), write(Grade), nl
    );
    (
      N = end -> (
        igc_helper(N, _)
      );
      igc_io_error
    )
  ),
  (N = end; igc).

igc_helper(end, _) :-
  write('You choose to end the program, thank you!'),
  nl, !.
igc_helper(N, Grade) :- N > 80, Grade = 'A', !.
igc_helper(N, Grade) :- N > 70, Grade = 'AB', !.
igc_helper(N, Grade) :- N > 65, Grade = 'B', !.
igc_helper(N, Grade) :- N > 60, Grade = 'BC', !.
igc_helper(N, Grade) :- N > 50, Grade = 'C', !.
igc_helper(N, Grade) :- N > 40, Grade = 'D', !.
igc_helper(N, Grade) :- N >= 0, Grade = 'E'.

% Remark 2
monotone([]) :- !.
monotone([_, _|[]]) :- !.
monotone([X, Y|T]) :-
  X =< Y,
  monotone_increasing([X, Y|T]), !.
monotone([X, Y|T]) :-
  monotone_decreasing([X, Y|T]).

monotone_increasing([]).
monotone_increasing([H|T]) :-
  monotone_increasing_helper(H, T),
  monotone_increasing(T).

monotone_increasing_helper(_, []).
monotone_increasing_helper(X, [H|T]) :-
  X =< H,
  monotone_increasing_helper(X, T).

monotone_decreasing([]) :- !.
monotone_decreasing([H|T]) :-
  monotone_decreasing_helper(H, T),
  monotone_decreasing(T).

monotone_decreasing_helper(_, []) :- !.
monotone_decreasing_helper(X, [H|T]) :-
  X >= H,
  monotone_decreasing_helper(X, T).

% Remark 3
hamming(L1, L2, Ans) :-
  length(L1, N),
  length(L2, M),
  N \== M,
  Ans = 'dimension error',
  !.
hamming([], [], 0).
hamming([H1|T1], [H2|T2], Ans) :-
  H1 = H2,
  hamming(T1, T2, Ans), !.
hamming([_|T1], [_|T2], Ans) :-
  hamming(T1, T2, N),
  Ans is N + 1.

% Remark 4
arithmetic([]).
arithmetic([_, _|[]]).
arithmetic([X, Y|T]) :-
  D is Y - X,
  arithmetic_helper(Y, D, T).

arithmetic_helper(_, _, []) :- !.
arithmetic_helper(Y, D, [H|T]) :-
  X is Y + D,
  %write(H),write(' '), write(X), nl,
  H == X,
  arithmetic_helper(H, D, T).

% Remark 5
maxodd(L, Ans) :-
  get_all_odds(L, Odds),
  [H|T] = Odds,
  get_max_odd(T, H, Ans).

get_all_odds([], []).
get_all_odds([H|T], Odds) :-
  1 is H mod 2 -> (
    Odds = [H|T1],
    get_all_odds(T, T1)
  );
  get_all_odds(T, Odds).

get_max_odd([], Ans, Ans).
get_max_odd([H|T], M, Ans) :-
  H > M -> (
    get_max_odd(T, H, Ans)
  );
  get_max_odd(T, M, Ans).

