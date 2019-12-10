
%Provided functions

append([], List, List).
append([Head|Tail], List2, [Head|List3]):- append(Tail, List2, List3).

member(X, [X|_]).
member(X, [_|Y]) :- member(X,Y).
%Brandi Durham
%320 Assignment 2

%1.
myLength([], 0).
myLength([X|Rest], Len):- myLength(Rest, LenRest), Len is 1 + LenRest.

%2.
myLast([X], X).
myLast([Head|Rest], L):-myLast(Rest, L).

%3.
myMax([X], X).
myMax([Head1, Head2|Rest], MaxVal):- Head1>= Head2, myMax([Head1|Rest], MaxVal).
myMax([Head1, Head2|Rest], MaxVal):- Head2> Head1, myMax([Head2|Rest], MaxVal).

%myMax([X], X).
%myMax([Head|Tail], Head):- myMax(Tail, TailMax), Head>=TailMax.
%myMax([Head|Tail], TailMax):-myMax(Tail, TailMax).

%4.
myRemove(X, [], []).
myRemove(X, [X|Rest], RedList):- myRemove(X, Rest, RedList).
myRemove(X, [Head|Rest], [Head|RedList]):-myRemove(X, Rest,  RedList).

%5.
myPerm([X], [X]).
myPerm([], []).
myPerm([Head1|Rest1],[Head2|Rest2]):- myLength([Head1|Rest1], Len1), myLength([Head2|Rest2], Len2), Len1=Len2, member(Head1, [Head2|Rest2]), member(Head2, [Head1|Rest1]), myRemove(Head1, [Head1|Rest1], List1), myRemove(Head1, [Head2|Rest2], List2), myRemove(Head2, List1, List3), myRemove(Head2, List2, List4), myPerm(List3, List4).

%myPerm([H1|T1],[H2|T2]):- mylength(T1,N), myLength(T2,N),  myRemove(H1,T1,R1T1), myRemove(H1,[H2|T2],R1L2),  myPerm(R1T1,R1L2).


%6.
intersect([X], [X], [X]).
intersect([], [], []).
intersect([], List, []).
intersect([Head1|Rest1], [Head2|Rest2], [Head1|IntList]):- member(Head1, [Head2|Rest2]), myRemove(Head1, [Head1|Rest1], List1), myRemove(Head1, [Head2|Rest2], List2), intersect(List1, List2, IntList).

%intersect([],List2,[]).
%intersect([H1|T1],List2,[H1|IntTail]) :- member(H1,List2), intersect(T1,List2,IntTail).
%intersect([H1|T1],List2,IntTail) :- not(member(H1,List2)), intersect(T1,List2,IntTail).


%7.
union([], X, X).
union([], [], []).
union(X, [], X).
union([Head1|Rest1], [Head2|Rest2], [Head1|UnionList]):- member(Head1, [Head2|Rest2]), myRemove(Head1, [Head1|Rest1], List1), myRemove(Head1,[Head2|Rest2], List2), union(List1, List2, UnionList).
union([Head1|Rest1], List2, [Head1|UnionList]):- myRemove(Head1, [Head1|Rest1], List1), union(List1, List2, UnionList).

%union([],List,List).
%union([H|T],List2,UnionList) :- member(H,List2), union(T,List2,UnionList).
%union([H|T],List2,[H|UList]) :- not(member(H,List2)),union(T,List2,UList).
