-module(guards).
-compile([export_all]).

old_enough(Age) when Age >= 16, Age =< 104 ->
    true;
old_enough(_) ->
    false.
