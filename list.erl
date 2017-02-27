-module(list).
-compile([export_all]).

len([]) -> 0;
len([_|Tail]) -> 1 + len(Tail).

tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_|Tail], Acc) -> tail_len(Tail, Acc + 1).

dup(0, _) -> [];
dup(N, term) when N > 0 -> [term|dup(N - 1, term)].

dup_tail(N, term) -> dup_tail(N, term, []).

dup_tail(0, _, List) -> List;
dup_tail(N, term, List) when N > 0 -> dup_tail(N - 1, term, [term|List]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

reverse_tail(L) -> reverse_tail(L, []).

reverse_tail([], Acc) -> Acc;
reverse_tail([H|T], Acc) -> reverse_tail(T, [H | Acc]).

sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 -> [H | sublist(T, N - 1)].

sublist_tail(L, N) -> reverse_tail(sublist_tail(L, N, [])).

sublist_tail(_, 0, Acc) -> Acc;
sublist_tail([], _, Acc) -> Acc;
sublist_tail([H|T], N, Acc) when N > 0 -> sublist_tail(T, N - 1, [H | Acc]).

% zip(A, B) -> [{a1, b1}, {a2, b2}]
% zip([a, b, c], [1, 2, 3]) => [{a, 1}, {b, 2}, {c, 3}]
zip([], _) -> [];
zip(_, []) -> [];
zip([H1|T1], [H2|T2]) -> [{H1, H2} | zip(T1, T2)].

zip_tail(Left, Right) -> reverse_tail(zip_tail(Left, Right, [])).
zip_tail([], _, Acc) -> Acc;
zip_tail(_, [], Acc) -> Acc;
zip_tail([H1|T1], [H2|T2], Acc) -> zip_tail(T1, T2, [{H1, H2} | Acc]).

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot, Rest, [], []),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_, [], Smaller, Larger) ->
    {Smaller, Larger};
partition(Pivot, [H | T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H | Smaller], Larger);
    H > Pivot -> partition(Pivot, T, Smaller, [H | Larger])
    end.
