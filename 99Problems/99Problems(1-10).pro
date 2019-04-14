:- initialization(main).

main :-
    List1 = [1, 2, 3, 4],
    List2 = ['a', 'b', 'c', 'd'],
    List3 = [],
    List4 = [1],
    List5 = [1, 3, 1],
    List6 = ['a', 'b', 'c', 'c', 'b', 'a'],
    List7 = [1, 2, [3, [4, 5]], 6],
    List8 = ['a', 'b', ['c', ['d', 'e']], 'f'],
    List9 = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'],
    List10 = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5],

    writeln("#1 last element of a list"),
    myLast(List1, LastElement1),
    format("~w -> ~w\n", [List1, LastElement1]),
    myLast(List2, LastElement2),
    format("~w -> ~w\n", [List2, LastElement2]),
    myLast(List3, LastElement3),
    format("~w -> ~w\n\n", [List3, LastElement3]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#2 last but one element of a list"),
    lastButOne(List1, LastButOneElement1),
    format("~w -> ~w\n", [List1, LastButOneElement1]),
    lastButOne(List2, LastButOneElement2),
    format("~w -> ~w\n", [List2, LastButOneElement2]),
    lastButOne(List3, LastButOneElement3),
    format("~w -> ~w\n\n", [List3, LastButOneElement3]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#3 k'th element of a list"),
    elementAt(List1, 2, ElementAt1),
    format("~w, ~w -> ~w\n", [List1, 2, ElementAt1]),
    elementAt(List2, 2, ElementAt2),
    format("~w, ~w -> ~w\n", [List2, 2, ElementAt2]),
    elementAt(List3, 2, ElementAt3),
    format("~w, ~w -> ~w\n\n", [List3, 2, ElementAt3]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#4 number of elements in a list"),
    myLength(List1, Length1),
    format("~w -> ~w\n", [List1, Length1]),
    myLength(List2, Length2),
    format("~w -> ~w\n", [List2, Length2]),
    myLength(List3, Length3),
    format("~w -> ~w\n\n", [List3, Length3]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#5 reverse a list"),
    myReverse(List1, ReversedList1),
    format("~w -> ~w\n", [List1, ReversedList1]),
    myReverse(List2, ReversedList2),
    format("~w -> ~w\n", [List2, ReversedList2]),
    myReverse(List3, ReversedList3),
    format("~w -> ~w\n\n", [List3, ReversedList3]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#6 is list a palindrome"),
    isPalindrom(List1, IsPalindrom1),
    format("~w -> ~w\n", [List1, IsPalindrom1]),
    isPalindrom(List2, IsPalindrom2),
    format("~w -> ~w\n", [List2, IsPalindrom2]),
    isPalindrom(List3, IsPalindrom3),
    format("~w -> ~w\n", [List3, IsPalindrom3]),
    isPalindrom(List4, IsPalindrom4),
    format("~w -> ~w\n", [List4, IsPalindrom4]),
    isPalindrom(List5, IsPalindrom5),
    format("~w -> ~w\n", [List5, IsPalindrom5]),
    isPalindrom(List6, IsPalindrom6),
    format("~w -> ~w\n\n", [List6, IsPalindrom6]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#7 flatten a nested list"),
    myFlatten(List1, FlattenedList1),
    format("~w -> ~w\n", [List1, FlattenedList1]),
    myFlatten(List2, FlattenedList2),
    format("~w -> ~w\n", [List2, FlattenedList2]),
    myFlatten(List3, FlattenedList3),
    format("~w -> ~w\n", [List3, FlattenedList3]),
    myFlatten(List7, FlattenedList7),
    format("~w -> ~w\n", [List7, FlattenedList7]),
    myFlatten(List8, FlattenedList8),
    format("~w -> ~w\n\n", [List8, FlattenedList8]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#8 remove consecutive duplicates in a list"),
    compress(List1, CompressedList1),
    format("~w -> ~w\n", [List1, CompressedList1]),
    compress(List2, CompressedList2),
    format("~w -> ~w\n", [List2, CompressedList2]),
    compress(List3, CompressedList3),
    format("~w -> ~w\n", [List3, CompressedList3]),
    compress(List9, CompressedList9),
    format("~w -> ~w\n", [List9, CompressedList9]),
    compress(List10, CompressedList10),
    format("~w -> ~w\n\n", [List10, CompressedList10]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#9 pack consecutive duplicates of elements into sublists"),
    pack(List1, PackedList1),
    format("~w -> ~w\n", [List1, PackedList1]),
    pack(List2, PackedList2),
    format("~w -> ~w\n", [List2, PackedList2]),
    pack(List3, PackedList3),
    format("~w -> ~w\n", [List3, PackedList3]),
    pack(List9, PackedList9),
    format("~w -> ~w\n", [List9, PackedList9]),
    pack(List10, PackedList10),
    format("~w -> ~w\n\n", [List10, PackedList10]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10),

    writeln("#10 run-length encoding of a list"),
    encode(List1, EncodedList1),
    format("~w -> ~w\n", [List1, EncodedList1]),
    encode(List2, EncodedList2),
    format("~w -> ~w\n", [List2, EncodedList2]),
    encode(List3, EncodedList3),
    format("~w -> ~w\n", [List3, EncodedList3]),
    encode(List9, EncodedList9),
    format("~w -> ~w\n", [List9, EncodedList9]),
    encode(List10, EncodedList10),
    format("~w -> ~w\n\n", [List10, EncodedList10]),
    resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10).

resetTestLists(List1, List2, List3, List4, List5, List6, List9, List10) :-
    List1 = [1, 2, 3, 4],
    List2 = ['a', 'b', 'c', 'd'],
    List3 = [],
    List4 = [1],
    List5 = [1, 3, 1],
    List6 = ['a', 'b', 'c', 'c', 'b', 'a'],
    List9 = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'],
    List10 = [1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5].

myLast(List, LastElement) :-
    List = [] -> LastElement = false;
    List = [Element] -> LastElement = Element;
    (
        List = [_ | Rest],
        myLast(Rest, LastElement)
    ).

lastButOne(List, LastButOneElement) :-
    List = [] -> LastButOneElement = false;
    List = [_] -> LastButOneElement = false;
    List = [Element, _] -> LastButOneElement = Element;
    (
        List = [_ | Rest],
        lastButOne(Rest, LastButOneElement)
    ).

elementAt(List, Position, ElementAt) :-
    Position < 1 -> ElementAt = false;
    Position =:= 1 ->
        (
            List = [] -> ElementAt = false;
            (
                List = [Element | _],
                ElementAt = Element
            )
        );
    Position > 1 ->
        (
            List = [] -> ElementAt = false;
            (
                List = [_ | Rest],
                elementAt(Rest, (Position - 1), ElementAt)
            )
        ).

myLength(List, Length) :-
    myLength(List, Length, 0).
myLength(List, Length, Accumulator) :-
    List = [] -> Length is Accumulator;
    (
        List = [_ | Rest],
        myLength(Rest, Length, (Accumulator + 1))
    ).

myReverse(List, ReversedList) :-
    myReverse(List, ReversedList, []).
myReverse(List, ReversedList, Accumulator) :-
    List = [] -> ReversedList = Accumulator;
    (
        List = [Element | Rest],
        NewAccumulator = [Element | Accumulator],
        myReverse(Rest, ReversedList, NewAccumulator)
    ).

isPalindrom(List, IsPalindrom) :-
    myReverse(List, List) -> IsPalindrom = true;
    IsPalindrom = false.

myFlatten(NestedList, FlattenedList) :-
    NestedList = [] -> FlattenedList = [];
    NestedList = [Element | Rest],
    (
        Element = [] -> myFlatten(Rest, FlattenedList);
        Element = [_ | _] ->
            (
                myFlatten(Element, FlattenedElement),
                myFlatten(Rest, FlattenedRest),
                append(FlattenedElement, FlattenedRest, FlattenedList)
            );
        myFlatten(Rest, FlattenedRest),
        append([Element], FlattenedRest, FlattenedList)
    ).

compress(List, CompressedList) :-
    compress(List, CompressedList, []).
compress(List, CompressedList, Accumulator) :-
    List = [] -> myReverse(Accumulator, CompressedList);
    List = [Element] -> myReverse([Element | Accumulator], CompressedList);
    List = [Element, NextElement | Rest],
    (
        Element == NextElement -> compress([NextElement | Rest], CompressedList, Accumulator);
        compress([NextElement | Rest], CompressedList, [Element | Accumulator])
    ).

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

encode(List, EncodedList) :-
    pack(List, PackedList),
    encode(PackedList, EncodedList, []).
encode(PackedList, EncodedList, Accumulator) :-
    PackedList = [] -> EncodedList = Accumulator;
    PackedList = [PackedSublist | Rest],
    (
        PackedSublist = [Element | _] ->
            (
                myLength(PackedSublist, Length),
                append(Accumulator, [[Length, Element]], NewAccumulator),
                encode(Rest, EncodedList, NewAccumulator)
            );
        encode(Rest, EncodedList, Accumulator)
    ).
