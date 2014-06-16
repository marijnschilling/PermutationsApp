PermutationsApp
===============

A little app to shows the result of the permutation-calculations on my iPhone

The program parses all possible solutions of the permutations of the number 2, 4, 8, 16 and 32 (no repetition allowed)
combined with the operators +, -, * and / (with repetition allowed) that have 11 as an outcome.

When you open the app the permutations of the numbers and the operators are being calculated immediately in the
PRMPermutationCreator class. The number permutations are being found with tail recursion. The oerator permutations are 
found with a four-double for-loop.

When the calculations are done the green start button on the screen is being activated. When you press it the 
PRMCombinationCalculator starts to calculate the outcome of all combinations of sets of numbers and operators. In total
there are 30,720 possible combinations. (120 number permutations times 256 operator permutations).

Every combination is being evaluated by the eval() function in Javascript to take presedence of operators into account.
All the combinations that have 11 as an outcome are shown in the PRMResultListViewController.




