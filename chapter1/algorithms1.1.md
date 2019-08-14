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

Q: Assuming that the value of n is known but m is allowed to range over all positive integers, what is the averaage number of times, Tn, that step E1 of Algorithm E will be performed?

A: of course, we could choice the infinity for m value, but after first E1 we get only remainder of m / n (which can't be greater than) and n itself. So then we have to find Tn we have to try the algorithm for m=1, m=2 ... m=n. (m=n and not m=n-1 (the max remainder is n-1) is because we got n-1 after first step), count the total number of times step E1 has been executed, and divide by n

*Math definition* of cimputational method:
1. consider a method as a quaruple (Q, I, O, f)
2. Q is a set, containing subsets I and O
3. f is a function from Q to Q

> the four quantities Q, I, O f are intnded to represent respectively the state of the computation, the input (I), the output (O) and the computational rule (f).

Each input `x` defines a *computational seq.*, `x0, x1, x2` ... where `x0 = x` and `x(k + 1) = f(xk)` for `k >= 0`

The computational sequence will be terminated in `k` steps if `k` is the smallest integer for which `xk` is in `O`(output), and in this case it is said to produce the output xk from x(input).

> what does it mean? It mean that when we get the value from output set (this is what we desired from algorithm), we will get it from minimum number of steps which is k.

Some computational sequences (`x0, x1, x2 ... xk`)  may never terminate; an *algorithm* is terminates in finitely many steps for all x in I.

> but if we give to algorithm unexpected input it could
stack in it.

**E. algorithm** formalization in described above sense.

1. Q - set of all singletons (n), all ordered pair (m,n) and all ordered quadruples (m,n,r,1), (m,n,r,2) and (m,n,p,3) where m,n and p are positive integers and r is >= 0.
2. I - is a subset of Q and contain all pair of (m,n)
3. O - is a subset of Q and contains all singletons (n)
4. f is defined as follows:
```
1. f((m,n)) = (m,n,0,1); f((n)) = (n);
2. f((m,n,r,1)) = (m,n,remainder of m divided by n, 2);
3. f((m,n,r,2)) = (n) if r = 0, (m,n,r,3) otherwise;
4. f((m,n,p,3)) = (n,p,p,1).
```

Explanation:
1. is just function call - we pass pair (m,n) to it. It prepares for further computations (2.) and return the initial conditions for second point. If we pass only n to it, then it just returns it.
2. The first step computation in inner function. If we consider (m,n,r,1) as (a,b,c,d) then `a,n` is an input, `r` is a remainder (in c-implementation we also have local variable `remainder`) and d is a function inner state.
3. Condition. Decide what to do next. Return the n as output or continue to find the remainder.
4. go to first inner step

EXERCISES:
1.
```
abcd
: b <-> c
acbd
: a <-> b
bcad
: d <-> a
bcda
```
2.
```
if m < n and m != 0
then r = m and f(n, r)
(m exchange n)
```
3. 57
6. Short answer: 9 / 5. Long answer: [code](./euclid-algorithm.c)
7. Um = (count of E1) / (count of calls). The same is for Tn. But for Um `m` is defined and `n` is undefined.
Condire the case
Um: m = 1, n is [1; infinity)
Tn: n = 1, m is [1; infinity)
in Um case m is always lesser then n which mean that for each call we will have addition E1 for exchange `m` and `n`. Therefore `count of E1` = `infinity + (Tn's count of E1)`. Hence `Um's count of E1` is equal to `Tn's count of E1 + n's upper bound (infinity) - n's lower bound (1)` and Um is equal to `Um's count` / `number of n`
8. TODO
9. TODO