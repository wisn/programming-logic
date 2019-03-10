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

% Problem 1
married(X, Y) :- parent(X, Z), parent(Y, Z), dif(X, Y).

% Problem 2
is_a_granson(X) :- parent(Y, X), parent(_, Y), male(X).
is_a_granddaughter(X) :- parent(Y, X), parent(_, Y), female(X).

% Problem 3
sibling(X, Y) :- parent(Z, X), parent(Z, Y).
brother(X, Y) :- sibling(X, Y), male(X), dif(X, Y).
sister(X, Y) :- sibling(X, Y), female(X), dif(X, Y).

% Problem 4
uncle(X, Y) :- parent(Z, Y), brother(X, Z).
uncle(X, Y) :- parent(Z, Y), sister(S, Z), married(X, S).
aunt(X, Y) :- parent(Z, Y), sister(X, Z).
aunt(X, Y) :- parent(Z, Y), brother(B, Z), married(X, B).

% Problem 5
is_a_nephew(X) :- parent(Y, X), sibling(Y, _), male(X).
is_a_niece(X) :- parent(Y, X), sibling(Y, _), female(X).

