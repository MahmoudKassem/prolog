main() :-
    isBracketingValid("([])[]({})", IsValid1),
    format("~w -> ~w\n", ["([])[]({})", IsValid1]),

    isBracketingValid("([)]", IsValid2),
    format("~w -> ~w\n", ["([)]", IsValid2]),

    isBracketingValid("((()", IsValid3),
    format("~w -> ~w\n", ["((()", IsValid3]),

    isBracketingValid("", IsValid4),
    format("~w -> ~w\n", ["", IsValid4]).

push(Top, Rest, [Top | Rest]).
pop([Top | Rest], Top, Rest).
empty([]).

isBracketingValid(BracketString, IsValid) :-
    string_chars(BracketString, BracketList),
    isBracketingValid(BracketList, [], IsValid).
isBracketingValid(Brackets, Stack, IsValid) :-
    Brackets = [] ->
        (
            empty(Stack) -> IsValid = true;
            IsValid = false
        );
    Brackets = [CurrentBracket | Rest],
    (
        (
            CurrentBracket == '('; CurrentBracket == '['; CurrentBracket == '{'
        ) ->
            (
                push(CurrentBracket, Stack, NewStack),
                isBracketingValid(Rest, NewStack, IsValid)
            );
        (
            pop(Stack, PreviousBracket, NewStack),
            (
                (PreviousBracket == '(', CurrentBracket == ')');
                (PreviousBracket == '[', CurrentBracket == ']');
                (PreviousBracket == '{', CurrentBracket == '}')
            ) ->
                isBracketingValid(Rest, NewStack, IsValid);
            IsValid = false
        )
    ).
