% encoding : a -> 1, b -> 2, ... , z -> 26
main() :-
    countDigitSequenceDecodings("111", Count1), % aaa, ak, ka
    format("~w -> ~w\n", ["111", Count1]),

    countDigitSequenceDecodings("1234", Count2), % abcd, lcd, awd
    format("~w -> ~w\n", ["1234", Count2]),

    countDigitSequenceDecodings("102", Count3), % jb
    format("~w -> ~w\n", ["102", Count3]).

countDigitSequenceDecodings(Code, Count) :-
    string_chars(Code, DigitList),
    (
        (
            DigitList = [];
            DigitList = [_]
        ) ->
            Count is 1;
        DigitList = [FirstDigit, SecondDigit | Rest],
        (
            FirstDigit @> '0' -> countDigitSequenceDecodings([SecondDigit | Rest], OneElementalDecoding);
            OneElementalDecoding is 0
        ),
        (
            (
                FirstDigit == '1';
                FirstDigit == '2', SecondDigit @< '7'
            ) ->
                countDigitSequenceDecodings(Rest, TwoElementalDecoding);
            TwoElementalDecoding is 0
        ),
        Count is OneElementalDecoding + TwoElementalDecoding
    ).
