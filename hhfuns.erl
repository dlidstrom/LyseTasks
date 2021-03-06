-module(hhfuns).
-compile([export_all]).

one() -> 1.
two() -> 2.
add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H + 1 | increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H - 1 | decrement(T)].

map(_, []) -> [];
map(Fcn, [H | T]) -> [Fcn(H) | map(Fcn, T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%% Only keep even numbers
even(L) -> lists:reverse(even(L, [])).

even([], Acc) -> Acc;
even([H | T], Acc) when H rem 2 == 0 ->
    even(T, [H | Acc]);

even([_ | T], Acc) -> even(T, Acc).

%% only keep men older than 60
old_men(L) -> lists:reverse(old_men(L, [])).

old_men([], Acc) -> Acc;
old_men([ Person = {male, Age} | People ], Acc) when Age > 60
    -> old_men(People, [Person | Acc]);
old_men([_ | People], Acc) -> old_men(People, Acc).

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H | T], Acc) ->
    case Pred(H) of
        true -> filter(Pred, T, [H | Acc]);
        false -> filter(Pred, T, Acc)
    end.

fold([], _, Initial) -> Initial;
fold([H | T], Fun, Acc) -> fold(T, Fun, Fun(H, Acc)).
