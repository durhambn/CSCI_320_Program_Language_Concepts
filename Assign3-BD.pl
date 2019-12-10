%Assignment 3 - Brandi Durham


%1. Fibonacci Sequence
fib(1,1).
fib(2,1).
fib(N, FN):- N>2, N1 is N-1, N2 is N-2, fib(N1, F1), fib(N2, F2), FN is F1+F2.


%2. Ackermann function
ack(0, Y, A):- A is Y+1.
ack(X, 0, A):- X2 is X-1, ack(X2, 1, A).
ack(X, Y, A):- Y1 is Y-1, X1 is X-1, ack(X, Y1, A1), ack(X1, A1, A).

%3. Mergesort algorithm
mergesort([], []).
mergesort(List, List):- length(List, L), L=1.
mergesort([X,Y], [X,Y]):-X=<Y.
mergesort([X,Y], [Y,X]):-X>Y.
mergesort(List, MSorted):- split(List, L, R), mergesort(L, LS), mergesort(R, RS), myMerge(LS, RS, MSorted).

split([], [], []).
split([X], [X], []).
split([L, R|Tail], [L|LTail], [R|RTail]):- split(Tail, LTail, RTail).

myMerge([], List, List).
myMerge(List, [], List).
myMerge([X|R1], [Y|R2], [X|R]):- X=<Y, myMerge(R1, [Y|R2], R).
myMerge([X|R1], [Y|R2], [Y|R]):- X>Y, myMerge([X|R1], R2, R).

%4a. Checks if binary tree
tree([]).
tree([X, [],[]]).
tree([X,L,R]):- tree(L), tree(R).

%4b. preorder traversal of tree
preorder([],[]).
preorder([X,[],[]],X).
preorder([X,L,R],PreorderList):-tree([X,L,R]), preorder(L, LL),preorder(R,RL), append([X|LL], RL, PreorderList).
