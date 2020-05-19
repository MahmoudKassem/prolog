:- initialization(main).

main :-
    List1 = [1, 2, 3, 4],
    List2 = ['a', 'b', 'c', 'd'],
    List3 = [],

    writeln("#21 insert an element at a given position into a list"),
    insertAt(List1, 5, 3, UpdatedList1),
    format("~w, ~w, ~w -> ~w\n", [List1, 5, 3, UpdatedList1]),
    insertAt(List2, 'e', 3, UpdatedList2),
    format("~w, ~w, ~w -> ~w\n", [List2, 'e', 3, UpdatedList2]),
    insertAt(List3, 5, 3, UpdatedList3),
    format("~w, ~w, ~w -> ~w\n\n", [List3, 5, 3, UpdatedList3]),

    writeln("#22 create a list containing all integers within a given range"),
    myRange(3, 8, ResultList1),
    format("~w, ~w -> ~w\n", [3, 8, ResultList1]),
    myRange(-8, -3, ResultList2),
    format("~w, ~w -> ~w\n", [-8, -3, ResultList2]),
    myRange(8, 3, ResultList3),
    format("~w, ~w -> ~w\n\n", [8, 3, ResultList3]),

    writeln("#23 extract a given number of randomly selected elements from a list"),
    randomSelection(List1, 3, ResultList4),
    format("~w, ~w -> ~w\n", [List1, 3, ResultList4]),
    randomSelection(List2, 3, ResultList5),
    format("~w, ~w -> ~w\n", [List2, 3, ResultList5]),
    randomSelection(List3, 3, ResultList6),
    format("~w, ~w -> ~w\n\n", [List3, 3, ResultList6]),

    writeln("#24 draw N different random numbers from the set 1..M"),
    lotto(6, 49, ResultList7),
    format("~w, ~w -> ~w\n", [6, 49, ResultList7]),
    lotto(0, 49, ResultList8),
    format("~w, ~w -> ~w\n", [0, 49, ResultList8]),
    lotto(6, 0, ResultList8),
    format("~w, ~w -> ~w\n", [6, 0, ResultList8]),
    lotto(49, 6, ResultList9),
    format("~w, ~w -> ~w\n\n", [49, 6, ResultList9]),

    writeln("#25 generate a random permutation of the elements of a list"),
    randomPermutation(List1, PermutatedList1),
    format("~w -> ~w\n", [List1, PermutatedList1]),
    randomPermutation(List2, PermutatedList2),
    format("~w -> ~w\n", [List2, PermutatedList2]),
    randomPermutation(List3, PermutatedList3),
    format("~w -> ~w\n\n", [List3, PermutatedList3]),

    halt(0).

insertAt(List, ValueToBeInserted, Position, UpdatedList) :-
    insertAt(List, ValueToBeInserted, Position, UpdatedList, 1, []).
insertAt(List, ValueToBeInserted, Position, UpdatedList, Index, Accumulator) :-
    List = [] -> UpdatedList = Accumulator;
    List = [Element | Rest],
    (
        Index =:= Position ->
            (
                append(Accumulator, [ValueToBeInserted, Element], NewAccumulator),
                insertAt(Rest, ValueToBeInserted, Position, UpdatedList, (Index + 1), NewAccumulator)
            );
        (
            append(Accumulator, [Element], NewAccumulator),
            insertAt(Rest, ValueToBeInserted, Position, UpdatedList, (Index + 1), NewAccumulator)
        )
    ).

myRange(LowerBound, HigherBound, ResultList) :-
    myRange(LowerBound, HigherBound, ResultList, []).
myRange(LowerBound, HigherBound, ResultList, Accumulator) :-
    LowerBound =< HigherBound ->
        (
            append(Accumulator, [LowerBound], NewAccumulator),
            NewLowerBound is LowerBound + 1,
            myRange(NewLowerBound, HigherBound, ResultList, NewAccumulator)
        );
    ResultList = Accumulator.

removeAt(List, Position, ResultList, RemovedElement) :-
    removeAt(List, Position, ResultList, RemovedElement, 1, []).
removeAt(List, Position, ResultList, RemovedElement, Index, Accumulator) :-
    List = [] ->
        (
            ResultList = Accumulator,
            RemovedElement = false
        );
    List = [Element | Rest],
    (
        Index =:= Position ->
            (
                RemovedElement = Element,
                append(Accumulator, Rest, ResultList)
            );
        (
            append(Accumulator, [Element], NewAccumulator),
            removeAt(Rest, Position, ResultList, RemovedElement, (Index + 1), NewAccumulator)
        )
    ).

randomSelection(List, NumberOfElements, ResultList) :-
    randomSelection(List, NumberOfElements, ResultList, []).
randomSelection(List, NumberOfElements, ResultList, Accumulator) :-
    (
        List = [];
        NumberOfElements =< 0
    ) ->
        ResultList = Accumulator;
    (
        length(List, ListLength),
        random(0, ListLength, RandomNumber),
        removeAt(List, (RandomNumber + 1), ReducedList, RemovedElement),
        append(Accumulator, [RemovedElement], NewAccumulator),
        randomSelection(ReducedList, (NumberOfElements - 1), ResultList, NewAccumulator)
    ).

lotto(NumberOfElements, HigherBound, ResultList) :-
    (
        HigherBound < NumberOfElements;
        HigherBound =< 0
    ) ->
        ResultList = [];
    (
        myRange(1, HigherBound, NumberInterval),
        randomSelection(NumberInterval, NumberOfElements, ResultList)
    ).

randomPermutation(List, PermutatedList) :-
    length(List, ListLength),
    randomSelection(List, ListLength, PermutatedList).
