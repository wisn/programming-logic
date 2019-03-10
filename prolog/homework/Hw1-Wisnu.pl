% male(X) denotes that X is a male.
male(benjamin).
male(david). male(edward). male(george).
male(james). male(lucas). male(mike). male(oscar).
male(peter). male(raymond). male(umberto).

% female(X) denotes that X is female.
female(anya).
female(clara). female(fiona).
female(hannah). female(ira). female(kiana). female(nancy).
female(quincy). female(sarah). female(tina). female(victoria).

% parent(X,Y) denotes that X is one of Y's parent.
parent(anya,clara). parent(anya,edward). parent(anya,fiona).
parent(benjamin,clara). parent(benjamin,edward). parent(benjamin,fiona).

parent(clara,hannah). parent(clara,ira). parent(clara,lucas).
parent(david,hannah). parent(david,ira). parent(david,lucas).

parent(fiona,mike). parent(fiona,nancy).
parent(george,mike). parent(george,nancy).

parent(ira,peter). parent(ira,quincy).
parent(james,peter). parent(james,quincy).

parent(kiana,raymond). parent(kiana,sarah). parent(kiana,tina).
parent(lucas,raymond). parent(lucas,sarah). parent(lucas,tina).

parent(nancy,umberto). parent(nancy,victoria).
parent(oscar,umberto). parent(oscar,victoria).

% birth(X,Y) explains the birth year of person X.
birth(anya,1938). birth(benjamin,1929).

birth(clara,1959). birth(david,1950). 
birth(edward,1963).
birth(fiona,1965). birth(george,1962).

birth(hannah,1980). 
birth(ira,1982). birth(james,1979).
birth(kiana,1990). birth(lucas,1986).

birth(mike,1991). 
birth(nancy,1994). birth(oscar,1992).

birth(peter,2005). birth(quincy,2008).
birth(raymond,2013). birth(sarah,2015). birth(tina,2018).

birth(umberto,2016). birth(victoria,2019).

% Helper
husband(X, Y) :- male(X), female(Y), parent(X, Z), parent(Y, Z).
wife(X, Y) :- husband(Y, X).

sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y).
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y).

% Problem 1
brother_in_law(X, Y) :-
  husband(X, Z), sister(Z, Y);
  brother(X, Z), (husband(Y, Z); wife(Y, Z));
  male(X), husband(X, Z), ((sister(P, Z); brother(P, Z)), (husband(Y, P); wife(Y, P))).

sister_in_law(X, Y) :-
  wife(X, Z), brother(Z, Y);
  sister(X, Z), (husband(Y, Z); wife(Y, Z));
  female(X), wife(X, Z), ((sister(P, Z); brother(P, Z)), (husband(Y, P); wife(Y, P))).

% Problem 2
son_in_law(X, Y) :- husband(X, Z), parent(Y, Z).

daughter_in_law(X, Y) :- wife(X, Z), parent(Y, Z).

% Problem 3
father_in_law(X, Y) :- male(X), (son_in_law(Y, X); daughter_in_law(Y, X)).

mother_in_law(X, Y) :- female(X), (son_in_law(Y, X); daughter_in_law(Y, X)).

% Problem 4
older(X, Y) :- birth(X, A), birth(Y, B), A < B.

younger(X, Y) :- birth(X, A), birth(Y, B), A > B.

% Problem 5
xiaodidi(X, Y) :- male(X), parent(Z, X), parent(Z, Y), younger(X, Y).

xiaomeimei(X, Y) :- female(X), parent(Z, X), parent(Z, Y), younger(X, Y).

