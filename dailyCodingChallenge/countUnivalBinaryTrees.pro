:- initialization(main).

main :-
    BinaryTree1 =
        binaryTree(
            0,
            binaryTree(
                1,
                nil,
                nil),
            binaryTree(
                0,
                binaryTree(
                    1,
                    binaryTree(
                        1,
                        nil,
                        nil),
                    binaryTree(
                        1,
                        nil,
                        nil)),
                binaryTree(
                    0,
                    nil,
                    nil))),

    printBinaryTree(BinaryTree1, 0), write("\n"),
    countUnivalBinaryTrees(BinaryTree1, Count1),
    format(" -> ~w\n\n", Count1),

    BinaryTree2 =
        binaryTree(
            1,
            binaryTree(
                1,
                binaryTree(
                    1,
                    nil,
                    nil),
                binaryTree(
                    1,
                    nil,
                    nil)),
            binaryTree(
                1,
                binaryTree(
                    1,
                    nil,
                    nil),
                binaryTree(
                    1,
                    nil,
                    nil))),

    printBinaryTree(BinaryTree2, 0), write("\n"),
    countUnivalBinaryTrees(BinaryTree2, Count2),
    format(" -> ~w\n\n", Count2),

    BinaryTree3 =
        binaryTree(
            1,
            binaryTree(
                1,
                binaryTree(
                    1,
                    nil,
                    nil),
                nil),
            binaryTree(
                1,
                binaryTree(
                    1,
                    nil,
                    nil),
                binaryTree(
                    1,
                    nil,
                    nil))),

    printBinaryTree(BinaryTree3, 0), write("\n"),
    countUnivalBinaryTrees(BinaryTree3, Count3),
    format(" -> ~w\n\n", Count3),

    halt(0).

printTabs(NumberOfTabs) :-
    NumberOfTabs > 0 ->
        (
            write("\t"),
            printTabs(NumberOfTabs - 1)
        );
    true.

printBinaryTree(BinaryTree, NumberOfTabs) :-
    BinaryTree = nil -> write("nil");
    BinaryTree = binaryTree(Value, Left, Right),
    writeln("binaryTree("),
    printTabs(NumberOfTabs + 1),
    writeln(Value),
    printTabs(NumberOfTabs + 1),
    printBinaryTree(Left, NumberOfTabs + 1),
    write("\n"),
    printTabs(NumberOfTabs + 1),
    printBinaryTree(Right, NumberOfTabs + 1),
    write("\n"),
    printTabs(NumberOfTabs),
    write(")").

countUnivalBinaryTrees(BinaryTree, Count) :-
    BinaryTree = nil -> Count = 0;
    BinaryTree = binaryTree(_, nil, nil) -> Count = 1;
    BinaryTree = binaryTree(_, nil, Right) ->
        (
            Count = RightCount + 1,
            countUnivalBinaryTrees(Right, RightCount)
        );
    BinaryTree = binaryTree(_, Left, nil) ->
        (
            Count = LeftCount + 1,
            countUnivalBinaryTrees(Left, LeftCount)
        );
    BinaryTree = binaryTree(_, binaryTree(ValueLeft, LeftLeft, LeftRight), binaryTree(ValueRight, RightLeft, RightRight)),
    countUnivalBinaryTrees(binaryTree(ValueLeft, LeftLeft, LeftRight), LeftCount),
    countUnivalBinaryTrees(binaryTree(ValueRight, RightLeft, RightRight), RightCount),
    (
        ValueLeft = ValueRight -> Count is 1 + LeftCount + RightCount;
        Count is LeftCount + RightCount
    ).
