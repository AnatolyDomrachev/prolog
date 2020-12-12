DOMAINS
num_list = nums*
nums = real
excludePointIndex = integer


PREDICATES
readNumsList(num_list, integer)
getEl(integer, num_list, real)
main(num_list)
main(num_list, integer)
findIntersectionPoints(num_list, excludePointIndex)
det(real, real, real, real, real)
checkIntersection(real, real, real, real, real, real)
isZero(real, real)


CLAUSES
readNumsList([], 0):-!.
readNumsList([Head|Tail], ElemsAmount):-ElemsAmount > 0,
readreal(Head), !,
NextElemsAmount = ElemsAmount - 1,
readNumsList(Tail, NextElemsAmount).

getEl(0, [Elem|_], Elem):-!.
getEl(Index, _, _):-
Index < 0, !, fail.
getEl(Index, [_|Tail], Elem):-
NextIndex = Index - 1,
getEl(NextIndex, Tail, Elem).

%-----------------------------—

findIntersectionPoints(Nums, 1):-
nl, write("Storona 1: "), nl,

getEl(8, Nums, X1), getEl(10, Nums, X2), getEl(9, Nums, Y1), getEl(11, Nums, Y2),
getEl(0, Nums, X3), getEl(2, Nums, X4), getEl(1, Nums, Y3), getEl(3, Nums, Y4),
X1mX2 = X1 - X2, X3mX4 = X3 - X4, Y1mY2 = Y1 - Y2, Y3mY4 = Y3 - Y4,

det(Denom, X1mX2, Y1mY2, X3mX4, Y3mY4),
%-----------------------------—
X1mX2 = X1 - X2, X2mX3 = X2 - X3, Y1mY2 = Y1 - Y2, Y3mY3 = Y2 - Y3,
det(Denom2, X1mX2, Y1mY2, X2mX3, Y2mY3),
%-----------------------------—
isZero(Denom, Denom2),

det(DetL1, X1, Y1, X2, Y2),
det(DetL2, X3, Y3, X4, Y4),

det(Xnom, DetL1, X1mX2, DetL2, X3mX4),
det(Ynom, DetL1, Y1mY2, DetL2, Y3mY4),

IxOut = Xnom / Denom,
IyOut = Ynom / Denom,

checkIntersection(X3, Y3, X4, Y4, IxOut, IyOut).

%------------------------------—

findIntersectionPoints(Nums, 2):-
nl, write("Storona 2: "), nl,

getEl(8, Nums, X1), getEl(10, Nums, X2), getEl(9, Nums, Y1), getEl(11, Nums, Y2),
getEl(2, Nums, X3), getEl(4, Nums, X4), getEl(3, Nums, Y3), getEl(5, Nums, Y4),
X1mX2 = X1 - X2, X3mX4 = X3 - X4, Y1mY2 = Y1 - Y2, Y3mY4 = Y3 - Y4,

det(Denom, X1mX2, Y1mY2, X3mX4, Y3mY4),
isZero(Denom),

det(DetL1, X1, Y1, X2, Y2),
det(DetL2, X3, Y3, X4, Y4),

det(Xnom, DetL1, X1mX2, DetL2, X3mX4),
det(Ynom, DetL1, Y1mY2, DetL2, Y3mY4),

IxOut = Xnom / Denom,
IyOut = Ynom / Denom,

checkIntersection(X3, Y3, X4, Y4, IxOut, IyOut).

%------------------------------—

findIntersectionPoints(Nums, 3):-
nl, write("Storona 3: "), nl,

getEl(8, Nums, X1), getEl(10, Nums, X2), getEl(9, Nums, Y1), getEl(11, Nums, Y2),
getEl(2, Nums, X3), getEl(4, Nums, X4), getEl(3, Nums, Y3), getEl(5, Nums, Y4),
X1mX2 = X1 - X2, X3mX4 = X3 - X4, Y1mY2 = Y1 - Y2, Y3mY4 = Y3 - Y4,
det(Denom, X1mX2, Y1mY2, X3mX4, Y3mY4),
isZero(Denom),

det(DetL1, X1, Y1, X2, Y2),
det(DetL2, X3, Y3, X4, Y4),

det(Xnom, DetL1, X1mX2, DetL2, X3mX4),
det(Ynom, DetL1, Y1mY2, DetL2, Y3mY4),

IxOut = Xnom / Denom,
IyOut = Ynom / Denom,

checkIntersection(X3, Y3, X4, Y4, IxOut, IyOut).

%------------------------------—

findIntersectionPoints(Nums, 4):-
nl, write("Storona 4: "), nl,

getEl(8, Nums, X1), getEl(10, Nums, X2), getEl(9, Nums, Y1), getEl(11, Nums, Y2),
getEl(4, Nums, X3), getEl(6, Nums, X4), getEl(5, Nums, Y3), getEl(7, Nums, Y4),
X1mX2 = X1 - X2, X3mX4 = X3 - X4, Y1mY2 = Y1 - Y2, Y3mY4 = Y3 - Y4,
det(Denom, X1mX2, Y1mY2, X3mX4, Y3mY4),
isZero(Denom),

det(DetL1, X1, Y1, X2, Y2),
det(DetL2, X3, Y3, X4, Y4),

det(Xnom, DetL1, X1mX2, DetL2, X3mX4),
det(Ynom, DetL1, Y1mY2, DetL2, Y3mY4),

IxOut = Xnom / Denom,
IyOut = Ynom / Denom,

checkIntersection(X3, Y3, X4, Y4, IxOut, IyOut).

%------------------------------—

det(Denom, A, B, C, D):-
Denom = A * D - B * C.

checkIntersection(X1, Y1, X2, Y2, Xint, Yint):-
Xint >= X1, Xint <= X2, write("X = ", Xint), nl, write("Y = ", Yint), nl ;
Xint <= X1, Xint >= X2, write("X = ", Xint), nl, write("Y = ", Yint), nl ;
write("Net peresechenia"), nl, !.

isZero(0,0):-write("Match"), nl, !, fail.
isZero(_,_):-!.


main(List):-
main(List, 4).
main(_, 0):-!.
main(List, Exclude):-
NextExclude = Exclude - 1,
main(List, NextExclude), fail ;
findIntersectionPoints(List, Exclude), !.


GOAL
Length=12,
write("Vvedite koord trapecii and koord pramoi: "), nl, nl,
readNumsList(List,Length),
main(List).
