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
    List11 = [2, 0, 2],
    List12 = [[1, 2, 3], [4, 5], [6, 7, 8], [4, 5], [9, 10, 11, 12], [13, 14], [15]],
    List13 = [['a', 'b', 'c'], ['d', 'e'], ['f', 'g', 'h'], ['d', 'e'], ['i', 'j', 'k', 'l'], ['m', 'n'], ['o']],

    writeln("#1 last element of a list"),
    last_(List1, Last1), format("~w -> ~w\n", [List1, Last1]),
    last_(List2, Last2), format("~w -> ~w\n", [List2, Last2]),
    last_(List3, Last3), format("~w -> ~w\n\n", [List3, Last3]),

    writeln("#2 last but one element of a list"),
    lastButOne(List1, LastButOne1), format("~w -> ~w\n", [List1, LastButOne1]),
    lastButOne(List2, LastButOne2), format("~w -> ~w\n", [List2, LastButOne2]),
    lastButOne(List3, LastButOne3), format("~w -> ~w\n\n", [List3, LastButOne3]),

    writeln("#3 k'th element of a list"),
    elementAt(List1, 2, ElementAt1), format("~w, ~w -> ~w\n", [List1, 2, ElementAt1]),
    elementAt(List2, 2, ElementAt2), format("~w, ~w -> ~w\n", [List2, 2, ElementAt2]),
    elementAt(List3, 2, ElementAt3), format("~w, ~w -> ~w\n\n", [List3, 2, ElementAt3]),

    writeln("#4 number of elements in a list"),
    length_(List1, Length1), format("~w -> ~w\n", [List1, Length1]),
    length_(List2, Length2), format("~w -> ~w\n", [List2, Length2]),
    length_(List3, Length3), format("~w -> ~w\n\n", [List3, Length3]),

    writeln("#5 reverse a list"),
    reverse_(List1, Reverse1), format("~w -> ~w\n", [List1, Reverse1]),
    reverse_(List2, Reverse2), format("~w -> ~w\n", [List2, Reverse2]),
    reverse_(List3, Reverse3), format("~w -> ~w\n\n", [List3, Reverse3]),

    writeln("#6 is list a palindrome"),
    isPalindrom(List1, IsPalindrom1), format("~w -> ~w\n", [List1, IsPalindrom1]),
    isPalindrom(List2, IsPalindrom2), format("~w -> ~w\n", [List2, IsPalindrom2]),
    isPalindrom(List3, IsPalindrom3), format("~w -> ~w\n", [List3, IsPalindrom3]),
    isPalindrom(List4, IsPalindrom4), format("~w -> ~w\n", [List4, IsPalindrom4]),
    isPalindrom(List5, IsPalindrom5), format("~w -> ~w\n", [List5, IsPalindrom5]),
    isPalindrom(List6, IsPalindrom6), format("~w -> ~w\n\n", [List6, IsPalindrom6]),

    writeln("#7 flatten a nested list"),
    flatten_(List1, Flatten1), format("~w -> ~w\n", [List1, Flatten1]),
    flatten_(List2, Flatten2), format("~w -> ~w\n", [List2, Flatten2]),
    flatten_(List3, Flatten3), format("~w -> ~w\n", [List3, Flatten3]),
    flatten_(List7, Flatten7), format("~w -> ~w\n", [List7, Flatten7]),
    flatten_(List8, Flatten8), format("~w -> ~w\n\n", [List8, Flatten8]),

    writeln("#8 remove consecutive duplicates in a list"),
    compress(List1, Compress1), format("~w -> ~w\n", [List1, Compress1]),
    compress(List2, Compress2), format("~w -> ~w\n", [List2, Compress2]),
    compress(List3, Compress3), format("~w -> ~w\n", [List3, Compress3]),
    compress(List9, Compress9), format("~w -> ~w\n", [List9, Compress9]),
    compress(List10, Compress10), format("~w -> ~w\n\n", [List10, Compress10]),

    writeln("#9 pack consecutive duplicates of elements into sublists"),
    pack(List1, Pack1), format("~w -> ~w\n", [List1, Pack1]),
    pack(List2, Pack2), format("~w -> ~w\n", [List2, Pack2]),
    pack(List3, Pack3), format("~w -> ~w\n", [List3, Pack3]),
    pack(List9, Pack9), format("~w -> ~w\n", [List9, Pack9]),
    pack(List10, Pack10), format("~w -> ~w\n\n", [List10, Pack10]),

    writeln("#10 run-length encoding of a list"),
    encode(List1, Encode1), format("~w -> ~w\n", [List1, Encode1]),
    encode(List2, Encode2), format("~w -> ~w\n", [List2, Encode2]),
    encode(List3, Encode3), format("~w -> ~w\n", [List3, Encode3]),
    encode(List9, Encode9), format("~w -> ~w\n", [List9, Encode9]),
    encode(List10, Encode10), format("~w -> ~w\n\n", [List10, Encode10]),

    writeln("#11 run-length encoding of a list(modified)"),
    encodeModified(List3, EncodeModified1), format("~w -> ~w\n", [List3, EncodeModified1]),
    encodeModified(List9, EncodeModified9), format("~w -> ~w\n", [List9, EncodeModified9]),
    encodeModified(List10, EncodeModified10), format("~w -> ~w\n\n", [List10, EncodeModified10]),

    writeln("#12 decode a run-length encoded list"),
    decodeModified(EncodeModified1, DecodeModified1), format("~w -> ~w\n", [EncodeModified1, DecodeModified1]),
    decodeModified(EncodeModified9, DecodeModified9), format("~w -> ~w\n", [EncodeModified9, DecodeModified9]),
    decodeModified(EncodeModified10, DecodeModified10), format("~w -> ~w\n\n", [EncodeModified10, DecodeModified10]),

    writeln("#13 run-length encoding of a list(direct solution)"),
    encodeDirect(List3, EncodeDirect1), format("~w -> ~w\n", [List3, EncodeDirect1]),
    encodeDirect(List9, EncodeDirect9), format("~w -> ~w\n", [List9, EncodeDirect9]),
    encodeDirect(List10, EncodeDirect10), format("~w -> ~w\n\n", [List10, EncodeDirect10]),

    writeln("#14 duplicate the elements of a list"),
    dupli(List3, Dupli1), format("~w -> ~w\n", [List3, Dupli1]),
    dupli(List9, Dupli9), format("~w -> ~w\n", [List9, Dupli9]),
    dupli(List10, Dupli10), format("~w -> ~w\n\n", [List10, Dupli10]),

    writeln("#15 replicate the elements of a list a given number of times"),
    repli(List3, 3, Repli1), format("~w, ~w -> ~w\n", [List3, 3, Repli1]),
    repli(List9, 3, Repli9), format("~w, ~w -> ~w\n", [List9, 3, Repli9]),
    repli(List10, 3, Repli10), format("~w, ~w -> ~w\n\n", [List10, 3, Repli10]),

    writeln("#16 drop every N'th element from a list"),
    drop(List3, 5, Drop3), format("~w, ~w -> ~w\n", [List3, 5, Drop3]),
    drop(List9, 5, Drop9), format("~w, ~w -> ~w\n", [List9, 5, Drop9]),
    drop(List10, 5, Drop10), format("~w, ~w -> ~w\n\n", [List10, 5, Drop10]),

    writeln("#17 split a list into two parts; the length of the first part is given"),
    split(List3, 5, Left1, Right1), format("~w, ~w -> (~w, ~w)\n", [List3, 5, Left1, Right1]),
    split(List9, 5, Left2, Right2), format("~w, ~w -> (~w, ~w)\n", [List9, 5, Left2, Right2]),
    split(List10, 5, Left3, Right3), format("~w, ~w -> (~w, ~w)\n\n", [List10, 5, Left3, Right3]),

    writeln("#18 Extract a slice from a list"),
    slice(List3, 3, 8, Slice1), format("~w, ~w, ~w -> ~w\n", [List3, 3, 8, Slice1]),
    slice(List9, 3, 8, Slice9), format("~w, ~w, ~w -> ~w\n", [List9, 3, 8, Slice9]),
    slice(List10, 3, 8, Slice10), format("~w, ~w, ~w -> ~w\n\n", [List10, 3, 8, Slice10]),

    writeln("#19 rotate a list n places to the left"),
    rotate(List3, 3, Rotate1), format("~w, ~w -> ~w\n", [List3, 3, Rotate1]),
    rotate(List9, 3, Rotate9), format("~w, ~w -> ~w\n", [List9, 3, Rotate9]),
    rotate(List10, -3, Rotate10), format("~w, ~w -> ~w\n", [List10, -3, Rotate10]),
    rotate(List10, 3, Rotate11), format("~w, ~w -> ~w\n\n", [List10, 3, Rotate11]),

    writeln("#20 remove the K'th element from a list"),
    removeAt(List3, 5, RemovedAt3, Removed3), format("~w, ~w -> (~w, ~w)\n", [List3, 5, RemovedAt3, Removed3]),
    removeAt(List9, 5, RemovedAt9, Removed9), format("~w, ~w -> (~w, ~w)\n", [List9, 5, RemovedAt9, Removed9]),
    removeAt(List10, 5, RemovedAt10, Removed10), format("~w, ~w -> (~w, ~w)\n\n", [List10, 5, RemovedAt10, Removed10]),

    writeln("#21 insert an element at a given position into a list"),
    insertAt(List1, 5, 3, InsertAt1), format("~w, ~w, ~w -> ~w\n", [List1, 5, 3, InsertAt1]),
    insertAt(List2, 'e', 3, InsertAt2), format("~w, ~w, ~w -> ~w\n", [List2, 'e', 3, InsertAt2]),
    insertAt(List3, 5, 3, InsertAt3), format("~w, ~w, ~w -> ~w\n\n", [List3, 5, 3, InsertAt3]),

    writeln("#22 create a list containing all integers within a given range"),
    range(3, 8, Range1), format("~w, ~w -> ~w\n", [3, 8, Range1]),
    range(-8, -3, Range2), format("~w, ~w -> ~w\n", [-8, -3, Range2]),
    range(8, 3, Range3), format("~w, ~w -> ~w\n\n", [8, 3, Range3]),

    writeln("#23 extract a given number of randomly selected elements from a list"),
    randomSelection(List1, 3, RandomSelection1), format("~w, ~w -> ~w\n", [List1, 3, RandomSelection1]),
    randomSelection(List2, 3, RandomSelection2), format("~w, ~w -> ~w\n", [List2, 3, RandomSelection2]),
    randomSelection(List3, 3, RandomSelection3), format("~w, ~w -> ~w\n\n", [List3, 3, RandomSelection3]),

    writeln("#24 draw N different random numbers from the set 1..M"),
    lotto(6, 49, Lotto1), format("~w, ~w -> ~w\n", [6, 49, Lotto1]),
    lotto(0, 49, Lotto2), format("~w, ~w -> ~w\n", [0, 49, Lotto2]),
    lotto(6, 0, Lotto3), format("~w, ~w -> ~w\n", [6, 0, Lotto3]),
    lotto(49, 6, Lotto4), format("~w, ~w -> ~w\n\n", [49, 6, Lotto4]),

    writeln("#25 generate a random permutation of the elements of a list"),
    randomPermutation(List1, RandomPermutation1), format("~w -> ~w\n", [List1, RandomPermutation1]),
    randomPermutation(List2, RandomPermutation2), format("~w -> ~w\n", [List2, RandomPermutation2]),
    randomPermutation(List3, RandomPermutation3), format("~w -> ~w\n\n", [List3, RandomPermutation3]),

    writeln("#26 generate the combinations of K distinct objects chosen from the N elements of a list"),
    combinations(List1, 3, Combinations1), format("~w, ~w -> ~w\n", [List1, 3, Combinations1]),
    combinations(List2, 3, Combinations2), format("~w, ~w -> ~w\n", [List2, 3, Combinations2]),
    combinations(List3, 3, Combinations3), format("~w, ~w -> ~w\n", [List3, 3, Combinations3]),
    combinations(List1, 0, Combinations4), format("~w, ~w -> ~w\n\n", [List1, 0, Combinations4]),

    writeln("#27 group the elements of a set into disjoint subsets"),
    groups(List1, List11, Groups1), format("~w, ~w -> ~w\n", [List1, List11, Groups1]),
    groups(List2, List11, Groups2), format("~w, ~w -> ~w\n", [List2, List11, Groups2]),
    groups(List3, List11, Groups3), format("~w, ~w -> ~w\n\n", [List3, List11, Groups3]),

    writeln("#28 sorting a list of lists according to length of sublists"),
    lsort(List12, LSorted12), format("~w -> ~w\n", [List12, LSorted12]),
    lsort(List13, LSorted13), format("~w -> ~w\n", [List13, LSorted13]),
    lsort(List3, LSorted3), format("~w -> ~w\n\n", [List3, LSorted3]),
    lfsort(List12, LfSorted12), format("~w -> ~w\n", [List12, LfSorted12]),
    lfsort(List13, LfSorted13), format("~w -> ~w\n", [List13, LfSorted13]),
    lfsort(List3, LfSorted3), format("~w -> ~w\n", [List3, LfSorted3]),

    halt(0).

last_(List, Last) :-
    List = [] -> Last = false;
    List = [Last];
    (
        List = [_ | Tail],
        last_(Tail, Last)
    ).

lastButOne(List, LastButOne) :-
    List = [] -> LastButOne = false;
    List = [_] -> LastButOne = false;
    List = [LastButOne, _];
    (
        List = [_ | Tail],
        lastButOne(Tail, LastButOne)
    ).

elementAt(List, Position, ElementAt) :-
    List = [] -> ElementAt = false;
    List = [Head | Tail] ->
    (
        Position < 1 -> ElementAt = false;
        Position =:= 1 -> ElementAt = Head;
        elementAt(Tail, (Position - 1), ElementAt)
    ).

length_(List, Length) :-
    length_(List, Length, 0).
length_(List, Length, Acc) :-
    List = [] -> Length is Acc;
    (
        List = [_ | Tail],
        length_(Tail, Length, (Acc + 1))
    ).

reverse_(List, Reversed) :-
    reverse_(List, Reversed, []).
reverse_(List, Reversed, Acc) :-
    List = [] -> Reversed = Acc;
    (
        List = [Head | Tail],
        reverse_(Tail, Reversed, [Head | Acc])
    ).

isPalindrom(List, IsPalindrom) :-
    reverse_(List, List) -> IsPalindrom = true;
    IsPalindrom = false.

flatten_(Nested, Flattened) :-
    \+is_list(Nested) -> Flattened = [Nested];
    Nested = [] -> Flattened = [];
    Nested = [Head | Tail],
    (
        flatten_(Head, FlattenedHead),
        flatten_(Tail, FlattenedTail),
        append(FlattenedHead, FlattenedTail, Flattened)
    ).

compress(List, Compressed) :-
    compress(List, Compressed, []).
compress(List, Compressed, Acc) :-
    List = [] -> reverse_(Acc, Compressed);
    List = [Head] -> reverse_([Head | Acc], Compressed);
    List = [Head, Next | Tail],
    (
        Head == Next -> compress([Next | Tail], Compressed, Acc);
        compress([Next | Tail], Compressed, [Head | Acc])
    ).

pack(List, Packed) :-
    pack(List, Packed, [], []).
pack(List, Packed, SubList, Acc) :-
    List = [] ->
        (
            SubList = [] -> reverse_(Acc, Packed);
            reverse_([SubList | Acc], Packed)
        );
    List = [Head | Tail],
    (
        SubList = [] ->
            pack(Tail, Packed, [Head], Acc);
        SubList = [Current | _],
        (
            Head == Current ->
                pack(Tail, Packed, [Current | SubList], Acc);
            pack(Tail, Packed, [Head], [SubList | Acc])
        )
    ).

encode(List, Encoded) :-
    pack(List, Packed),
    encode(Packed, Encoded, []).
encode(Packed, Encoded, Acc) :-
    Packed = [] -> reverse_(Acc, Encoded);
    Packed = [SubList | Tail],
    SubList = [Head | _],
    length_(SubList, Length),
    encode(Tail, Encoded, [[Length, Head] | Acc]).

encodeModified(List, Encoded) :-
    pack(List, Packed),
    encodeModified(Packed, Encoded, []).
encodeModified(Packed, Encoded, Acc) :-
    Packed = [] -> reverse_(Acc, Encoded);
    Packed = [Sublist | Tail],
    Sublist = [Head | _],
    length_(Sublist, Replications),
    (
        Replications > 1 ->
            encodeModified(Tail, Encoded, [[Replications, Head] | Acc]);
        encodeModified(Tail, Encoded, [Head | Acc])
    ).

replicateHead(Replications, Head, List, Replicated) :-
    Replications =< 0 -> Replicated = List;
    replicateHead((Replications - 1), Head, [Head | List], Replicated).

decodeModified(Encoded, Decoded) :-
    decodeModified(Encoded, Decoded, []).
decodeModified(Encoded, Decoded, Acc) :-
    Encoded = [] -> reverse_(Acc, Decoded);
    Encoded = [EncodedHead | Tail],
    (
        EncodedHead = [Replications, Head] ->
            (
                replicateHead(Replications, Head, Acc, NewAcc),
                decodeModified(Tail, Decoded, NewAcc)
            );
        decodeModified(Tail, Decoded, [EncodedHead | Acc])
    ).

removeReplications(Current, List, Replications, Reduced) :-
    removeReplications(Current, List, Replications, Reduced, 1).
removeReplications(Current, List, Replications, Reduced, Acc) :-
    List = [] ->
        (
            Replications is Acc,
            Reduced = List
        );
    List = [Head | Tail],
    (
        Current == Head ->
            removeReplications(Current, Tail, Replications, Reduced, (Acc + 1));
        (
            Replications is Acc,
            Reduced = List
        )
    ).

encodeDirect(List, Encoded) :-
    encodedList(List, Encoded, []).
encodedList(List, Encoded, Acc) :-
    List = [] -> reverse_(Acc, Encoded);
    List = [Head | Tail],
    removeReplications(Head, Tail, Replications, Reduced),
    (
        Replications > 1 ->
            encodedList(Reduced, Encoded, [[Replications, Head] | Acc]);
        encodedList(Tail, Encoded, [Head | Acc])
    ).

dupli(List, Duplicated) :-
    dupli(List, Duplicated, []).
dupli(List, Duplicated, Acc) :-
    List = [] -> reverse_(Acc, Duplicated);
    List = [Head | Tail],
    dupli(Tail, Duplicated, [Head, Head | Acc]).

repli(List, Replications, Replicated) :-
    repli(List, Replications, Replicated, []).
repli(List, Replications, Replicated, Acc) :-
    List = [] -> reverse_(Acc, Replicated);
    List = [Head | Tail],
    replicateHead(Replications, Head, Acc, NewAcc),
    repli(Tail, Replications, Replicated, NewAcc).

drop(List, Frequency, Reduced) :-
    drop(List, Frequency, Reduced, 1, []).
drop(List, Frequency, Reduced, Count, Acc) :-
    List = [] -> reverse_(Acc, Reduced);
    List = [Head | Tail],
    (
        Count =:= Frequency ->
            drop(Tail, Frequency, Reduced, 1, Acc);
        drop(Tail, Frequency, Reduced, (Count + 1), [Head | Acc])
    ).

split(List, Position, Left, Right) :-
    split(List, Position, Left, Right, 1, [], []).
split(List, Position, Left, Right, Index, LeftAcc, RightAcc) :-
    List = [] ->
        (
            reverse_(LeftAcc, Left),
            reverse_(RightAcc, Right)
        );
    List = [Head | Tail],
    (
        Index =< Position ->
            split(Tail, Position, Left, Right, (Index + 1), [Head | LeftAcc], RightAcc);
        split(Tail, Position, Left, Right, (Index + 1), LeftAcc,  [Head | RightAcc])
    ).

slice(List, Start, End, Slice) :-
    slice(List, Start, End, Slice, 1, []).
slice(List, Start, End, Slice, Index, Acc) :-
    List = [] -> reverse_(Acc, Slice);
    List = [Head | Tail],
    (
        Index > End -> reverse_(Acc, Slice);
        (
            Index >= Start,
            Index =< End
        ) ->
            slice(Tail, Start, End, Slice, (Index + 1), [Head | Acc]);
        slice(Tail, Start, End, Slice, (Index + 1), Acc)
    ).

rotate(List, Positions, Rotated) :-
    (
        Positions =:= 0;
        List = []
    ) ->
        Rotated = List;
    (
        Positions > 0 ->
            (
                split(List, Positions, Left, Right),
                append(Right, Left, Rotated)
            );
        (
            length_(List, Length),
            split(List, (Length + Positions), Left, Right),
            append(Right, Left, Rotated)
        )
    ).

removeAt(List, Position, Reduced, RemovedElement) :-
    removeAt(List, Position, Reduced, RemovedElement, 1, []),
    (
        var(RemovedElement) -> RemovedElement = false;
        true
    ).
removeAt(List, Position, Reduced, Removed, Index, Acc) :-
    List = [] -> reverse_(Acc, Reduced);
    List = [Head | Tail],
    (
        Index =:= Position ->
            (
                Removed = Head,
                removeAt(Tail, Position, Reduced, Removed, (Index + 1), Acc)
            );
        removeAt(Tail, Position, Reduced, Removed, (Index + 1), [Head | Acc])
    ).

insertAt(List, Value, Position, Increased) :-
    insertAt(List, Value, Position, Increased, 1, []).
insertAt(List, Value, Position, Increased, Index, Acc) :-
    List = [] -> reverse_(Acc, Increased);
    List = [Head | Tail],
    (
        Index =:= Position ->
            insertAt(Tail, Value, Position, Increased, (Index + 1), [Head, Value | Acc]);
        insertAt(Tail, Value, Position, Increased, (Index + 1), [Head | Acc])
    ).

range(Minimum, Maximum, Range) :-
    range(Minimum, Maximum, Range, []).
range(Minimum, Maximum, Range, Acc) :-
    Minimum =< Maximum ->
        (
            Next is Minimum + 1,
            range(Next, Maximum, Range, [Minimum | Acc])
        );
    reverse_(Acc, Range).

randomSelection(List, Draws, Selection) :-
    length_(List, Length),
    randomSelection(List, Draws, Selection, Length, []).
randomSelection(List, Draws, Selection, Length, Acc) :-
    (
        Draws =< 0;
        List = []
    ) ->
        reverse_(Acc, Selection);
    (
        random_between(1, Length, RandomNumber),
        removeAt(List, RandomNumber, Reduced, RandomElement),
        ReducedLength is Length - 1,
        randomSelection(Reduced, (Draws - 1), Selection, ReducedLength, [RandomElement | Acc])
    ).

lotto(Draws, Maximum, Lotto) :-
    (
        Maximum < Draws;
        Maximum =< 0
    ) ->
        Lotto = [];
    (
        range(1, Maximum, Interval),
        randomSelection(Interval, Draws, Lotto)
    ).

randomPermutation(List, Permutation) :-
    length_(List, Length),
    randomSelection(List, Length, Permutation).

combinations(List, Draws, Combinations) :-
    Draws =< 0 -> Combinations = [[]];
    (
        List = [] -> Combinations = [];
        List = [Head | Tail],
        combinations(Tail, (Draws - 1), SubCombinations),
        findall([Head | Combination], member(Combination, SubCombinations), WithHead),
        combinations(Tail, Draws, WithoutHead),
        append(WithHead, WithoutHead, Combinations)
    ).

isElement(List, Element) :-
    List = [] -> false;
    List = [Head | Tail],
    (
        Element == Head -> true;
        isElement(Tail, Element)
    ).

difference(List1, List2, Difference) :-
    difference(List1, List2, Difference, []).
difference(List1, List2, Difference, Acc) :-
    List1 = [] -> reverse_(Acc, Difference);
    List1 = [Head | Tail],
    (
        \+isElement(List2, Head) ->
            difference(Tail, List2, Difference, [Head | Acc]);
        difference(Tail, List2, Difference, Acc)
    ).

groups(List, Sizes, Groups) :-
    Sizes = [] -> Groups = [[]];
    Sizes = [Head | Tail],
    (
        combinations(List, Head, Combinations),
        findall([Combination | Group],
        (
            member(Combination, Combinations), 
            difference(List, Combination, Difference),
            groups(Difference, Tail, SubGroups),
            member(Group, SubGroups)
        ), Groups)
    ).

pivot(Predicate, Pivot, List, Less, GreaterOrEqual) :-
    pivot(Predicate, Pivot, List, ReversedLess, ReversedGreaterOrEqual, [], []),
    reverse_(ReversedLess, Less),
    reverse_(ReversedGreaterOrEqual, GreaterOrEqual).
pivot(Predicate, Pivot, List, Less, GreaterOrEqual, AccLess, AccGreaterOrEqual) :-
    List = [] ->
    (
        Less = AccLess,
        GreaterOrEqual = AccGreaterOrEqual
    );
    List = [Head | Tail],
    (
        call(Predicate, Head, ResultHead),
        call(Predicate, Pivot, ResultPivot),
        ResultHead < ResultPivot ->
            pivot(Predicate, Pivot, Tail, Less, GreaterOrEqual, [Head | AccLess], AccGreaterOrEqual);
        pivot(Predicate, Pivot, Tail, Less, GreaterOrEqual, AccLess, [Head | AccGreaterOrEqual])
    ).

sortBy(Predicate, List, Sorted) :-
    sortBy(Predicate, List, ReversedSorted, []),
    reverse_(ReversedSorted, Sorted).
sortBy(Predicate, List, Sorted, Acc) :-
    List = [] -> Sorted = Acc;
    List = [Head | Tail],
	pivot(Predicate, Head ,Tail, Less, GreaterOrEqual),
	sortBy(Predicate, Less, SortedLess, Acc),
    sortBy(Predicate, GreaterOrEqual, Sorted, [Head | SortedLess]).

lsort(List, Sorted) :-
    List = [] -> Sorted = [];
    sortBy(length_, List, Sorted).

group(Predicate, Key, List, Group) :-
    group(Predicate, Key, List, Group, [Key]).
group(Predicate, Key, List, Group, Acc) :-
    List = [] -> reverse_(Acc, Group);
    List = [Head | Tail],
    (
        call(Predicate, Head, ResultHead),
        call(Predicate, Key, ResultKey),
        ResultHead == ResultKey ->
            group(Predicate, Key, Tail, Group, [Head | Acc]);
        group(Predicate, Key, Tail, Group, Acc)
    ).

groupBy(Predicate, List, Grouped) :-
    groupBy(Predicate, List, Grouped, []).
groupBy(Predicate, List, Grouped, Acc) :-
    List = [] -> reverse_(Acc, Grouped);
    List = [Head | Tail],
    group(Predicate, Head, Tail, Group),
    difference(List, Group, Difference),
    groupBy(Predicate, Difference, Grouped, [Group | Acc]).

lfsort(List, Sorted) :-
    List = [] -> Sorted = [];
    groupBy(length_, List, Groups),
    lsort(Groups, SortedGroups),
    findall(GroupMember,
    (
        member(Group, SortedGroups),
        member(GroupMember, Group)
    ), Sorted).
