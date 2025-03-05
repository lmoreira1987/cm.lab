// See https://aka.ms/new-console-template for more information
// Console.WriteLine("Hello, World!");

// // #001
// int[] array = [3, 5, -1, 8, 11, 1, -1, 6];
// int targetSum = 10;
// Result: -1 + 11 = 10

// Console.WriteLine(string.Join(", ", GreenTwoNumberSum.TwoNumberSum(array, targetSum)));
// Console.WriteLine(string.Join(", ", GreenTwoNumberSum.TwoNumberSumWithHashtable(array, targetSum)));

// Console.WriteLine(string.Join(", ", GreenBubbleSort.BubbleSort([8, 5, 2, 9, 5, 6, 3])));

// PalindromeCheck.IsPalindrome("ab");

//Tree.Setup();
// TreeND.Setup();
// Solution01.Setup();
// Console.WriteLine("Index: " + FirstUniqueCharProblem.FirstUniqueChar("leodevl"));
//Console.WriteLine("Index: " + BinarySearchProblem.BinarySearch(new int[]{0, 1, 21, 33, 45, 45, 61, 71, 72, 73}, 33));
// Console.WriteLine(string.Join(", ", InsertionSortProblem.InsertionSort(new int[]{8, 5, 2, 9, 5, 6, 3})));
// Console.WriteLine(IsValidSubsequenceProblem.IsValidSubsequence(
//             new List<int> { 5, 1, 22, 25, 6, -1, 8, 10 },
//             new List<int> { 1, 6, -1, 10 }
//         ));


// Criando os nós e a estrutura do grafo
        DepthFirstSearchProgram.Node root = new DepthFirstSearchProgram.Node("A");
        root.AddChild("B").AddChild("C").AddChild("D");
        root.children[0].AddChild("E").AddChild("F");
        root.children[2].AddChild("G").AddChild("H");
        root.children[0].children[1].AddChild("I").AddChild("J");
        root.children[2].children[0].AddChild("K");

        // Lista para armazenar a saída
        List<string> result = new List<string>();

        // Executando a busca em profundidade
        result = root.DepthFirstSearch(result);

        // Exibindo o resultado
        Console.WriteLine(string.Join(", ", result));

