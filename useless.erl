-module(useless).
%-export([add/2, hello/0, greet_and_add_two/1, greet/2]).
-compile([export_all]).

add(A, B) ->
    A + B.

%% Shows greetings.
hello() ->
    io:format(
        "Hello, World!~n"
        ++ "Line: "
        ++ erlang:integer_to_list(?LINE)
        ++ "~n")
    .

greet_and_add_two(X) ->
    hello(),
    add(X, 2)
    .

greet(male, Name) ->
    io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
    io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
    io:format("Hello, ~s!", [Name]).

head([H|_]) -> H.
second([_,X|_]) -> X.
third([_,_,X|_]) -> X.
