Word **algorithm** didn't methioned until 1957. Before that date the word **alrogism** exists, which is mean the process of doing arithmetic using Arabic numerals

By 1950, the word **alrogithm** was most frequently associated with Euclid's algorithm.

**Algorithm E**.
Input: two positive numbers m and n

Output: greatest common divisor of m and n

Process:
1. [Find remainder.] m % n = r where r is the remainder. (0 =< r < n)
2. [Is it zero?] If r = 0, n is the answer
3. [Reduce.] Set m <- n, n <- r, goto 1.

[c-implementation](./euclid-algorithm.c)

> "<-" - replacement operation (assigment). m <- n means replace value of m by value of n. In general "variable <- formula". "m <-> n" means Exchange m and n and is equivelent to "t <- m, m <- n, n <- t"

The modern meaning of **algorithm** is quite similar to that of *recipe, method, technique, procedure, routine...*, except algorithm has five important features:

1. *Finitness*. Must be terminated after a finite number of steps. (Recursive function that stack in a loop isn't algorithm, right?)

> A procedure that has all of the features except first may be called a *computational method*. Consider method that compare two things and return the greates - if two things aren't comparable, then method will be stacked and lose finitness of steps)

2. *Definitness*. Each step of algorithm must be precisely defined. Algorithm that described via English language for non-native speaker may lose this property. For this the *programming languages* were designed - specify algorithms in which every statement has a very definite meaning.

> An expression of a computational method in a computer language is called a program

3. *Input*. Must have zero or more inputs

4. *Output*. Must have one or more outputs.

```
After first step in Euclid A. we got
m = qn + r where q is integer
If r = 0
Then
  m is a multiple of n (by factor of q) and n is clearly the greatest common divisor of m and n
Else
  /* Cannot find out */
```

5. *Effectiveness*. Must be effective, or perhaps we exepecting that

For determine the performance of algorithm the discipline of *algorithimc analysis* is exist.