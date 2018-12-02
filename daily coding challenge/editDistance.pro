main :-
    editDistance("kitten", "sitting", Distance1),
    format("~w, ~w -> ~w\n", ["kitten", "sitting", Distance1]),

    editDistance("test", "tset", Distance2),
    format("~w, ~w -> ~w\n", ["test", "tset", Distance2]),

    editDistance("giraf", "farig", Distance3),
    format("~w, ~w -> ~w\n", ["giraf", "farig", Distance3]).

editDistance(String1, String2, Distance) :-
    string_chars(String1, CharacterList1), string_chars(String2, CharacterList2),
    editDistance(CharacterList1, CharacterList2, Distance, 0).
editDistance(CharacterList1, CharacterList2, Distance, Accumulator) :-
    CharacterList1 == CharacterList2 -> Distance = Accumulator;
    CharacterList1 = [] ->
        (
            length(CharacterList2, Length2),
            Distance is Accumulator + Length2
        );
    CharacterList2 = [] ->
        (
            length(CharacterList1, Length1),
            Distance is Accumulator + Length1
        );
    CharacterList1 = [Charater1 | Rest1],
    CharacterList2 = [Charater2 | Rest2],
        (
            Charater1 \= Charater2 ->
                (
                    NewAccumulator is Accumulator + 1,
                    editDistance(Rest1, Rest2, Distance, NewAccumulator)
                );
            editDistance(Rest1, Rest2, Distance, Accumulator)
        ).

:- main.
