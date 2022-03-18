% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)

and(X,Y) :- X, Y.

or(X,Y) :- X; Y.

not(X) :- \+X.

equ(X,Y) :- or(and(X,Y), and(not(X), not(Y))).

xor(X,Y) :- and(or(X,Y), or(not(X), not(Y))).


print_truth_table([A|B]) :- format('~s ~s ~s~n', A), print_truth_table(B).

truth_table(A, B, C) :- bagof([A, B, K], (member(A, [true, fail]), member(B,[true, fail]), (call(C)->K=true; K=fail)), Z),
                        print_truth_table(Z).

% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
%   ?- truth_table(A,B,and(A,xor(A,B))).
%   true true fail
%   true fail true
%   fail true fail
%   fail fail fail
%
%   ?- truth_table(A,B,and(A,xor(not(A),B))).
%   true true true
%   true fail fail
%   fail true fail
%   fail fail fail
%
%   ?- truth_table(A,B,and(A,equ(not(A),B))).
%   true true fail
%   true fail true
%   fail true fail
%   fail fail fail
