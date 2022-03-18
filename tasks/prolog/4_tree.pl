% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

partition_rec([LEFT | LIST], PIVOT, LEFT_LIST, [LEFT | RIGHT_LIST]) :- LEFT > PIVOT, partition_rec(LIST, PIVOT, LEFT_LIST, RIGHT_LIST).

partition_rec([LEFT | LIST], PIVOT, [LEFT | LEFT_LIST], RIGHT_LIST) :- LEFT =< PIVOT, partition_rec(LIST, PIVOT, LEFT_LIST, RIGHT_LIST).

partition_rec([],_, [], []).

q_partition(LIST, LEFT_LIST, PIVOT, RIGHT_LIST) :-
    length(LIST, LEN), MIDDLE is div(LEN, 2),
    nth0(MIDDLE, LIST, PIVOT),
    nth0(MIDDLE, LIST, _, NEW_LIST),
    partition_rec(NEW_LIST, PIVOT, LEFT_LIST, RIGHT_LIST).


qsort(LIST, RESULT) :- member(_,LIST), q_partition(LIST, LEFT_LIST, PIVOT, RIGHT_LIST), qsort(LEFT_LIST, LEFT_RESULT), qsort(RIGHT_LIST, RIGHT_RESULT), append(LEFT_RESULT, [PIVOT|RIGHT_RESULT], RESULT).

qsort(_, []).


balanced_tree_rec(LIST, instant(PIVOT, T_LEFT, T_RIGHT)) :- member(_,LIST), q_partition(LIST, LEFT_LIST, PIVOT, RIGHT_LIST), balanced_tree_rec(LEFT_LIST, T_LEFT), balanced_tree_rec(RIGHT_LIST, T_RIGHT).

balanced_tree_rec(_, empty).

balanced_tree(L,T) :- qsort(L, SORTED_LIST), balanced_tree_rec(SORTED_LIST, T).

