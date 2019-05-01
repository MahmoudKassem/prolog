:- initialization(main).

main :-
    pairSumsToNumber(17, [10, 5, 7, 8], Pair1),
    format("~w, ~w -> (~w)\n", [17, [10, 5, 7, 8], Pair1]),

    pairSumsToNumber(2, [0, 1], Pair2),
    format("~w, ~w -> ~w\n", [2, [0, 1], Pair2]),

    pairSumsToNumber(0, [-1, 0, 1], Pair3),
    format("~w, ~w -> (~w)\n", [0, [-1, 0, 1], Pair3]),

    pairSumsToNumber(10, [5, 0, 5], Pair4),
    format("~w, ~w -> (~w)\n", [10, [5, 0, 5], Pair4]),

    halt(0).

pairSumsToNumber(Number, List, Pair) :-
    (
        select(A, List, ListWithoutA),
        select(B, ListWithoutA, _),
        Number =:= A + B
    ) ->
        Pair = (A, B);
    Pair = false.
