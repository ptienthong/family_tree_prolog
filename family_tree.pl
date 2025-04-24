% ----------------------------
% 1. Basic Relationships
% ----------------------------

% Gender facts
male(john).
male(michael).
male(paul).
male(george).
male(david).
male(james).

female(mary).
female(linda).
female(susan).
female(elizabeth).
female(anna).

% Parent-child relationships
parent(john, michael).
parent(mary, michael).

parent(john, linda).
parent(mary, linda).

parent(michael, david).
parent(susan, david).

parent(michael, elizabeth).
parent(susan, elizabeth).

parent(linda, george).
parent(paul, george).

parent(linda, anna).
parent(paul, anna).

% ----------------------------
% 2. Derived Relationships
% ----------------------------

% 2.1 Grandparent
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% 2.2 Sibling (same parent, different individuals)
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% 2.3 Cousin (their parents are siblings)
cousin(X, Y) :-
    parent(PX, X),
    parent(PY, Y),
    sibling(PX, PY),
    PX \= PY.

% ----------------------------
% 3. Logical Inference Queries
% ----------------------------

% 3.1 Children of a person
child(X, Y) :-
    parent(Y, X).

% 3.2 All children
children(Parent, Children) :-
    findall(C, child(C, Parent), Children).

% 3.3 Siblings of a person
siblings(Person, Siblings) :-
    findall(S, (sibling(Person, S)), Siblings).

% 3.4 Check cousin relationship
is_cousin(X, Y) :-
    cousin(X, Y).

% ----------------------------
% 4. Recursive Logic
% ----------------------------

% 4.1 Descendants
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).
