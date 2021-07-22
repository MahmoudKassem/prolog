:- initialization(main).

main :-
    writeln("#31 determine whether a given integer number is prime"),
    isPrime(1, IsPrime1), format("~w -> ~w\n", [1, IsPrime1]),
    isPrime(31, IsPrime2), format("~w -> ~w\n\n", [31, IsPrime2]),

    writeln("#32 determine the prime factors of a given positive integer"),
    primeFactors(1, PrimeFactors1), format("~w -> ~w\n", [1, PrimeFactors1]),
    primeFactors(315, PrimeFactors2), format("~w -> ~w\n\n", [315, PrimeFactors2]),

    writeln("#33 determine the prime factors of a given positive integer (2)"),
    primeFactorsMult(1, PrimeFactorsMult1), format("~w -> ~w\n", [1, PrimeFactorsMult1]),
    primeFactorsMult(315, PrimeFactorsMult2), format("~w -> ~w\n\n", [315, PrimeFactorsMult2]),

    writeln("#34 a list of prime numbers"),
    primesList(1, 2, PrimesList1), format("~w, ~w -> ~w\n", [1, 2, PrimesList1]),
    primesList(3, 15, PrimesList2), format("~w, ~w -> ~w\n\n", [3, 15, PrimesList2]),

    writeln("#35 goldbach's conjecture"),
    goldbach(28, Goldbach1), format("~w -> ~w\n", [28, Goldbach1]),
    goldbach(256, Goldbach2), format("~w -> ~w\n\n", [256, Goldbach2]),

    writeln("#36 a list of Goldbach compositions"),
    goldbachList(1, 4, GoldbachList1), format("~w, ~w -> ~w\n", [1, 4, GoldbachList1]),
    goldbachList(4, 16, GoldbachList2), format("~w, ~w -> ~w\n\n", [4, 16, GoldbachList2]),

    writeln("#37 determine the greatest common divisor of two positive integer numbers"),
    greatestCommonDivisor(7, 23, GreatestCommonDivisor1), format("~w, ~w -> ~w\n", [7, 23, GreatestCommonDivisor1]),
    greatestCommonDivisor(36, 63, GreatestCommonDivisor2), format("~w, ~w -> ~w\n\n", [36, 63, GreatestCommonDivisor2]),

    writeln("#38 determine whether two positive integer numbers are coprime"),
    coprime(36, 63, Coprime1), format("~w, ~w -> ~w\n", [36, 63, Coprime1]),
    coprime(7, 23, Coprime2), format("~w, ~w -> ~w\n\n", [7, 23, Coprime2]),

    writeln("#39 calculate Euler's totient function phi(m)"),
    totient(1, Totient1), format("~w -> ~w\n", [1, Totient1]),
    totient(10, Totient2), format("~w -> ~w\n\n", [10, Totient2]),

    writeln("#40 calculate Euler's totient function phi(m) (2)"),
    totientEfficient(1, TotientEfficient1), format("~w -> ~w\n", [1, TotientEfficient1]),
    totientEfficient(10, TotientEfficient2), format("~w -> ~w\n\n", [10, TotientEfficient2]),

    writeln("#41 compare the two methods of calculating Euler's totient function"),
    get_time(Start1),
    totient(10090, Totient3),
    get_time(End1),
    ExecutionTime1 is End1 - Start1,
    format("intial implementation with ~w -> ~w took ~ws\n", [10090, Totient3, ExecutionTime1]),

    get_time(Start2),
    totientEfficient(10090, Totient4),
    get_time(End2),
    ExecutionTime2 is End2 - Start2,
    format("improved implementation with ~w -> ~w took ~ws\n", [10090, Totient4, ExecutionTime2]),

    halt(0).

isPrime(Number, IsPrime) :-
    Number >= 2 -> isPrime(Number, IsPrime, 2);
    IsPrime = false.
isPrime(Number, IsPrime, I) :-
    I * I > Number -> IsPrime = true;
    Number mod I =:= 0 -> IsPrime = false;
    isPrime(Number, IsPrime, (I + 1)).

primeFactors(Number, PrimeFactors) :-
    primeFactors(Number, ReversedPrimeFactors, 3, []),
    reverse(ReversedPrimeFactors, PrimeFactors).
primeFactors(Number, PrimeFactors, I, Acc) :-
    Number mod 2 =:= 0 ->
        (
            NewNumber is Number div 2,
            primeFactors(NewNumber, PrimeFactors, I, [2 | Acc])
        );
    Number mod I =:= 0 ->
        (
            NewNumber is Number div I,
            primeFactors(NewNumber, PrimeFactors, I, [I | Acc])
        );
    I * I =< Number -> 
        (
            NewI is I + 2,
            primeFactors(Number, PrimeFactors, NewI, Acc)
        );
    Number > 2 -> PrimeFactors = [Number | Acc];
    PrimeFactors = Acc.

removeMultiples(Current, List, Multiplicity, Reduced) :-
    removeMultiples(Current, List, Multiplicity, Reduced, 1).
removeMultiples(Current, List, Multiplicity, Reduced, Acc) :-
    List = [] ->
        (
            Multiplicity is Acc,
            Reduced = List
        );
    List = [Head | Tail],
    (
        Current == Head ->
            removeMultiples(Current, Tail, Multiplicity, Reduced, (Acc + 1));
        (
            Multiplicity is Acc,
            Reduced = List
        )
    ).

primeFactorsMult(Number, PrimeFactorsMult) :-
    primeFactors(Number, PrimeFactors),
    primeFactorsMult(Number, PrimeFactors, PrimeFactorsMult, []).
primeFactorsMult(Number, PrimeFactors, PrimeFactorsMult, Acc) :-
    PrimeFactors = [] -> reverse(Acc, PrimeFactorsMult);
    PrimeFactors = [Head | Tail],
    removeMultiples(Head, Tail, Multiplicity, Reduced),
    (
        Multiplicity > 1 ->
            primeFactorsMult(Number, Reduced, PrimeFactorsMult, [(Head, Multiplicity) | Acc]);
        primeFactorsMult(Number, Tail, PrimeFactorsMult, [(Head, 1) | Acc])
    ).

primesList(Start, End, PrimesList) :-
    (
        Start < 2,
        End < 2;
        Start > End
    ) -> PrimesList = [];
    findall(Prime,
    (
        between(Start, End, Prime),
        isPrime(Prime, IsPrime), IsPrime
    ), PrimesList).

goldbach(Number,(A, B)) :-
    (
        Number < 4;
        Number mod 2 =:= 1
    ) -> 
        (
            A = 0,
            B = 0
        );
    primesList(2, Number, PrimesList),
    member(A, PrimesList),
    member(B, PrimesList),
    A + B =:= Number.

goldbachList(Start, End, GoldbachList) :-
    (
        Start < 4,
        End < 4;
        Start > End
    ) -> GoldbachList = [];
    End == 4 -> GoldbachList = [(4, 2, 2)];
    findall(Number,
    (
        between(Start, End, Number),
        Number mod 2 =:= 0
    ), EvenNumbers),
    maplist([Number, (Number, A, B)] >> goldbach(Number, (A, B)), EvenNumbers, GoldbachList).

greatestCommonDivisor(A, B, GreatestCommonDivisor) :-
    B =:= 0 -> GreatestCommonDivisor is A;
    greatestCommonDivisor(B, A mod B, GreatestCommonDivisor).

coprime(A, B, Coprime) :-
    greatestCommonDivisor(A, B, GreatestCommonDivisor),
    GreatestCommonDivisor =:= 1 -> Coprime = true;
    Coprime = false.

totient(Number, Totient) :-
    Number =:= 1 -> Totient is 1;
    totient(Number, Totient, 1, 0).
totient(Number, Totient, I, Acc) :-
    I >= Number -> Totient is Acc;
    (
        (
            coprime(Number, I, Coprime),
            Coprime
        ) ->
            (
                NewI is I + 1,
                NewAcc is Acc + 1,
                totient(Number, Totient, NewI, NewAcc)
            );
        (
            NewI is I + 1,
            totient(Number, Totient, NewI, Acc)
        )
    ).

totientEfficient(Number, Totient) :-
    primeFactorsMult(Number, PrimeFactorsMult),
    maplist([PrimeFactorMult, Term] >>
    (
        PrimeFactorMult = (PrimeFactor, Multiplicity),
        Term = (PrimeFactor - 1) * PrimeFactor ** (Multiplicity - 1)
    ), PrimeFactorsMult, Terms),
    foldl([A, B, C] >> (C is A * B), Terms, 1, Totient).
