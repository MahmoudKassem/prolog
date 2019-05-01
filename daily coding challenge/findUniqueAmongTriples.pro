:- initialization(main).

main :-
    findUniqueAmongTriples([6, 1, 3, 3, 3, 6, 6], Unique1),
    format("~w -> ~w\n", [[6, 1, 3, 3, 3, 6, 6], Unique1]),

    findUniqueAmongTriples([13, 19, 13, 13], Unique2),
    format("~w -> ~w\n", [[13, 19, 13, 13], Unique2]),

    findUniqueAmongTriples([10, -13, -19, -13, -13, 10, 10], Unique3),
    format("~w -> ~w\n", [[10, -13, -19, -13, -13, 10, 10], Unique3]),

    halt(0).

countOnesAtBitPosition(List, OneAtBitPosition, OnesCount) :-
    countOnesAtBitPosition(List, OneAtBitPosition, OnesCount, 0).
countOnesAtBitPosition(List, OneAtBitPosition, OnesCount, Accumulator) :-
    List = [] -> OnesCount is Accumulator;
    List = [Element | Rest],
    (
        Element /\ OneAtBitPosition > 0 ->
            countOnesAtBitPosition(Rest, OneAtBitPosition, OnesCount, (Accumulator + 1));
        countOnesAtBitPosition(Rest, OneAtBitPosition, OnesCount, Accumulator)
    ).

findUniqueAmongTriples(List, UniqueElement) :-
    findUniqueAmongTriples(List, 0, UniqueElement, 0).
findUniqueAmongTriples(List, BitPosition, UniqueElement, Accumulator) :-
    BitPosition =:= 31 ->
        (
            Accumulator /\ (1 << 30) > 0 -> UniqueElement is Accumulator - 2 ** 31;
            UniqueElement is Accumulator
        );
    (
        (
            OneAtBitPosition is 1 << BitPosition,
            countOnesAtBitPosition(List, OneAtBitPosition, OnesCount),
            OnesCount mod 3 =\= 0
        ) ->
            findUniqueAmongTriples(List, (BitPosition + 1), UniqueElement, (Accumulator \/ OneAtBitPosition));
        findUniqueAmongTriples(List, (BitPosition + 1), UniqueElement, Accumulator)
    ).
