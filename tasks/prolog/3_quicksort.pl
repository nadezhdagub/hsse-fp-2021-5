qsort([X|XTail], XSorted):-
 partition(X, XTail, L, R),
    qsort(L, LSorted),
    qsort(R, RSorted),
 append(LSorted, [X|RSorted], XSorted).

qsort([],[]).


partition(X, [CompElem|XTail], [CompElem|L], R):-
    CompElem =< X,
    partition(X, XTail, L, R).

partition(X,[CompElem|XTail],L,[CompElem|R]):-
    CompElem > X,
    partition(X, XTail, L, R).

partition(X,[],[],[]).


split_middle(X, L, R):-
 length(X, Len),
 M is div(Len, 2),
 length(L, M),
 append(L, R, X).


build_balanced_tree(List, instant(Root, LTree, RTree)) :-
 split_middle(List, L, [Root|R]),
 balanced_tree(L, LTree),
 balanced_tree(R, RTree).

build_balanced_tree([], empty).


balanced_tree(L, T) :-
 qsort(L, LSorted),
 build_balanced_tree(LSorted, T).
%?- balanced_tree([3,2,4],instant(3, instant(2, empty, empty), instant(4, empty, empty)))
%true
