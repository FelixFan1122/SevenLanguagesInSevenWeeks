fib := method(n, 
    a := 1;
    b := 1;
    while (n > 2, 
        c := a + b;
        a = b;
        b = c;
        n = n - 1
    );
    b
)

fib(1) println
fib(2) println
fib(3) println
fib(10) println