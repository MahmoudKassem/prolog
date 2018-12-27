:- initialization(main).

main :-
    List1 = [],
    List2 = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'],
    List3 = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5],

    writeln("#11 run-length encoding of a list(modified)"),
    encodeModified(List1, EncodedList1),
    format("~w -> ~w\n", [List1, EncodedList1]),
    encodeModified(List2, EncodedList2),
    format("~w -> ~w\n", [List2, EncodedList2]),
    encodeModified(List3, EncodedList3),
    format("~w -> ~w\n\n", [List3, EncodedList3]),
    resetTestLists(List1, List2, List3),

    writeln("#12 decode a run-length encoded list"),
    decodeModified(EncodedList1, DecodedList1),
    format("~w -> ~w\n", [EncodedList1, DecodedList1]),
    decodeModified(EncodedList2, DecodedList2),
    format("~w -> ~w\n", [EncodedList2, DecodedList2]),
    decodeModified(EncodedList3, DecodedList3),
    format("~w -> ~w\n\n", [EncodedList3, DecodedList3]),
    resetTestLists(List1, List2, List3),

    writeln("#13 run-length encoding of a list(direct solution)"),
    encodeDirect(List1, EncodedList1),
    format("~w -> ~w\n", [List1, EncodedList1]),
    encodeDirect(List2, EncodedList2),
    format("~w -> ~w\n", [List2, EncodedList2]),
    encodeDirect(List3, EncodedList3),
    format("~w -> ~w\n\n", [List3, EncodedList3]),
    resetTestLists(List1, List2, List3),

    writeln("#14 duplicate the elements of a list"),
    dupli(List1, DuplicatedList1),
    format("~w -> ~w\n", [List1, DuplicatedList1]),
    dupli(List2, DuplicatedList2),
    format("~w -> ~w\n", [List2, DuplicatedList2]),
    dupli(List3, DuplicatedList3),
    format("~w -> ~w\n\n", [List3, DuplicatedList3]),
    resetTestLists(List1, List2, List3),

    writeln("#15 replicate the elements of a list a given number of times"),
    repli(List1, 3, ReplicatedList1),
    format("~w, ~w -> ~w\n", [List1, 3, ReplicatedList1]),
    repli(List2, 3, ReplicatedList2),
    format("~w, ~w -> ~w\n", [List2, 3, ReplicatedList2]),
    repli(List3, 3, ReplicatedList3),
    format("~w, ~w -> ~w\n\n", [List3, 3, ReplicatedList3]),
    resetTestLists(List1, List2, List3),

    writeln("#16 drop every N'th element from a list"),
    myDrop(List1, 5, ReducedList1),
    format("~w, ~w -> ~w\n", [List1, 5, ReducedList1]),
    myDrop(List2, 5, ReducedList2),
    format("~w, ~w -> ~w\n", [List2, 5, ReducedList2]),
    myDrop(List3, 5, ReducedList3),
    format("~w, ~w -> ~w\n\n", [List3, 5, ReducedList3]),
    resetTestLists(List1, List2, List3),

    writeln("#17 split a list into two parts; the length of the first part is given"),
    split(List1, 5, FirstPart1, SecondPart1),
    format("~w, ~w -> (~w, ~w)\n", [List1, 5, FirstPart1, SecondPart1]),
    split(List2, 5, FirstPart2, SecondPart2),
    format("~w, ~w -> (~w, ~w)\n", [List2, 5, FirstPart2, SecondPart2]),
    split(List3, 5, FirstPart3, SecondPart3),
    format("~w, ~w -> (~w, ~w)\n\n", [List3, 5, FirstPart3, SecondPart3]),
    resetTestLists(List1, List2, List3),

    writeln("#18 Extract a slice from a list"),
    slice(List1, 3, 8, SlicedList1),
    format("~w, ~w, ~w -> ~w\n", [List1, 3, 8, SlicedList1]),
    slice(List2, 3, 8, SlicedList2),
    format("~w, ~w, ~w -> ~w\n", [List2, 3, 8, SlicedList2]),
    slice(List3, 3, 8, SlicedList3),
    format("~w, ~w, ~w -> ~w\n\n", [List3, 3, 8, SlicedList3]),
    resetTestLists(List1, List2, List3),

    writeln("#19 rotate a list n places to the left"),
    rotate(List1, 3, RotatedList1),
    format("~w, ~w -> ~w\n", [List1, 3, RotatedList1]),
    rotate(List2, 3, RotatedList2),
    format("~w, ~w -> ~w\n", [List2, 3, RotatedList2]),
    rotate(List3, -3, RotatedList3),
    format("~w, ~w -> ~w\n", [List3, -3, RotatedList3]),
    rotate(List3, 3, RotatedList4),
    format("~w, ~w -> ~w\n\n", [List3, 3, RotatedList4]),
    resetTestLists(List1, List2, List3),

    writeln("#20 remove the K'th element from a list"),
    removeAt(List1, 5, ResultList1, RemovedElement1),
    format("~w, ~w -> (~w, ~w)\n", [List1, 5, ResultList1, RemovedElement1]),
    removeAt(List2, 5, ResultList2, RemovedElement2),
    format("~w, ~w -> (~w, ~w)\n", [List2, 5, ResultList2, RemovedElement2]),
    removeAt(List3, 5, ResultList3, RemovedElement3),
    format("~w, ~w -> (~w, ~w)\n\n", [List3, 5, ResultList3, RemovedElement3]).

resetTestLists(List1, List2, List3) :-
    List1 = [],
    List2 = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'],
    List3 = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5].

pack(List, PackedList) :-
    pack(List, PackedList, [], []).
pack(List, PackedList, PackedSublist, Accumulator) :-
    List = [] ->
        (
            PackedSublist = [] -> PackedList = Accumulator;
            append(Accumulator, [PackedSublist], PackedList)
        );
    List = [Element | Rest],
    (
        PackedSublist = [] ->
            (
                append(PackedSublist, [Element], NewPackedSublist),
                pack(Rest, PackedList, NewPackedSublist, Accumulator)
            );
        PackedSublist = [DuplicateElement | _],
        (
            DuplicateElement == Element ->
                (
                    append(PackedSublist, [Element], NewPackedSublist),
                    pack(Rest, PackedList, NewPackedSublist, Accumulator)
                );
            append(Accumulator, [PackedSublist], NewAccumulator),
            pack(Rest, PackedList, [Element], NewAccumulator)
        )
    ).

encodeModified(List, EncodedList) :-
    pack(List, PackedList),
    encodeModified(PackedList, EncodedList, []).
encodeModified(PackedList, EncodedList, Accumulator) :-
    PackedList = [] -> EncodedList = Accumulator;
    PackedList = [PackedSublist | Rest],
    (
        PackedSublist = [Element | _] ->
            (
                length(PackedSublist, Length),
                (
                    Length > 1 ->
                        (
                            append(Accumulator, [[Length, Element]], NewAccumulator),
                            encodeModified(Rest, EncodedList, NewAccumulator)
                        );
                    (
                        append(Accumulator, [Element], NewAccumulator),
                        encodeModified(Rest, EncodedList, NewAccumulator)
                    )
                )
            );
        encodeModified(Rest, EncodedList, Accumulator)
    ).

repeatElement(NumberOfRepitions, Element, ListWithRepitions):-
    repeatElement(NumberOfRepitions, Element, ListWithRepitions, []).
repeatElement(NumberOfRepitions, Element, ListWithRepitions, Accumulator) :-
    NumberOfRepitions =< 0 -> ListWithRepitions = Accumulator;
    append(Accumulator, [Element], NewAccumulator),
    repeatElement((NumberOfRepitions - 1), Element, ListWithRepitions, NewAccumulator).

decodeModified(EncodedList, DecodedList) :-
    decodeModified(EncodedList, DecodedList, []).
decodeModified(EncodedList, DecodedList, Accumulator) :-
    EncodedList = [] -> DecodedList = Accumulator;
    EncodedList = [EncodedElement | EncodedRest],
    (
        EncodedElement = [Length, Element] ->
            (
                repeatElement(Length, Element, ListWithRepitions),
                append(Accumulator, ListWithRepitions, NewAccumulator),
                decodeModified(EncodedRest, DecodedList, NewAccumulator)
            );
        append(Accumulator, [EncodedElement], NewAccumulator),
        decodeModified(EncodedRest, DecodedList, NewAccumulator)
    ).

countAndRemoveConsecutiveDuplicates(Element, List, RunLength, ReducedRest) :-
    countAndRemoveConsecutiveDuplicates(Element, List, RunLength, ReducedRest, 1).
countAndRemoveConsecutiveDuplicates(Element, List, RunLength, ReducedRest, Accumulator) :-
    List = [] ->
        (
            RunLength is Accumulator,
            ReducedRest = List
        );
    List = [SubElement | Rest],
    (
        Element == SubElement ->
            countAndRemoveConsecutiveDuplicates(Element, Rest, RunLength, ReducedRest, (Accumulator + 1));
        (
            RunLength is Accumulator,
            ReducedRest = List
        )
    ).

encodeDirect(List, EncodedList) :-
    encodedList(List, EncodedList, []).
encodedList(List, EncodedList, Accumulator) :-
    List = [] -> EncodedList = Accumulator;
    List = [Element | Rest],
    countAndRemoveConsecutiveDuplicates(Element, Rest, RunLength, ReducedRest),
    (
        RunLength > 1 ->
            (
                append(Accumulator, [[RunLength, Element]], NewAccumulator),
                encodedList(ReducedRest, EncodedList, NewAccumulator)
            );
        (
            append(Accumulator, [Element], NewAccumulator),
            encodedList(Rest, EncodedList, NewAccumulator)
        )
    ).

dupli(List, DuplicatedList) :-
    dupli(List, DuplicatedList, []).
dupli(List, DuplicatedList, Accumulator) :-
    List = [] -> DuplicatedList = Accumulator;
    List = [Element | Rest],
    append(Accumulator, [Element, Element], NewAccumulator),
    dupli(Rest, DuplicatedList, NewAccumulator).

repli(List, NumberOfRepitions, ReplicatedList) :-
    repli(List, NumberOfRepitions, ReplicatedList, []).
repli(List, NumberOfRepitions, ReplicatedList, Accumulator) :-
    List = [] -> ReplicatedList = Accumulator;
    List = [Element | Rest],
    repeatElement(NumberOfRepitions, Element, ReplicatedSubList),
    append(Accumulator, ReplicatedSubList, NewAccumulator),
    repli(Rest, NumberOfRepitions, ReplicatedList, NewAccumulator).

myDrop(List, Number, ReducedList) :-
    myDrop(List, Number, ReducedList, 1, []).
myDrop(List, Number, ReducedList, Count, Accumulator) :-
    List = [] -> ReducedList = Accumulator;
    List = [Element | Rest],
    (
        Count =:= Number ->
            myDrop(Rest, Number, ReducedList, 1, Accumulator);
        (
            append(Accumulator, [Element], NewAccumulator),
            myDrop(Rest, Number, ReducedList, (Count + 1), NewAccumulator)
        )
    ).

split(List, LengthOfFirstPart, FirstPart, SecondPart) :-
    split(List, LengthOfFirstPart, FirstPart, SecondPart, 0, [], []).
split(List, LengthOfFirstPart, FirstPart, SecondPart, Index, FirstPartAccumulator, SecondPartAccumulator) :-
    List = [] ->
        (
            FirstPart = FirstPartAccumulator,
            SecondPart = SecondPartAccumulator
        );
    List = [Element | Rest],
    (
        Index < LengthOfFirstPart ->
            (
                append(FirstPartAccumulator, [Element], NewAccumulator),
                split(Rest, LengthOfFirstPart, FirstPart, SecondPart, (Index + 1), NewAccumulator, SecondPartAccumulator)
            );
        (
            append(SecondPartAccumulator, [Element], NewAccumulator),
            split(Rest, LengthOfFirstPart, FirstPart, SecondPart, (Index + 1), FirstPartAccumulator, NewAccumulator)
        )
    ).

slice(List, LowerBound, HigherBound, SlicedList) :-
    slice(List, LowerBound, HigherBound, SlicedList, 1, []).
slice(List, LowerBound, HigherBound, SlicedList, Index, Accumulator) :-
    List = [] -> SlicedList = Accumulator;
    List = [Element | Rest],
    (
        (
            Index >= LowerBound,
            Index =< HigherBound
        ) ->
            (
                append(Accumulator, [Element], NewAccumulator),
                slice(Rest, LowerBound, HigherBound, SlicedList, (Index + 1), NewAccumulator)
            );
        slice(Rest, LowerBound, HigherBound, SlicedList, (Index + 1), Accumulator)
    ).

rotate(List, Positions, RotatedList) :-
    (
        List = [];
        Positions =:= 0
    ) ->
        RotatedList = List;
    (
        Positions > 0 ->
            (
                split(List, Positions, FirstPart, SecondPart),
                append(SecondPart, FirstPart, RotatedList)
            );
        (
            length(List, ListLength),
            split(List, (ListLength + Positions), FirstPart, SecondPart),
            append(SecondPart, FirstPart, RotatedList)
        )
    ).

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
