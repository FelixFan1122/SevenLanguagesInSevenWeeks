List myAverage := method(
    if(self size == 0, 0, 
    sum := 0;
    number := 0;
    self foreach(v, 
        if(v proto == Number,
            sum = sum + v; number = number + 1,
            Exception raise)
    );
    sum / number)
);

list() myAverage println
list(1) myAverage println
list(1, 2, 3) myAverage println
list(1, 2, 3, 4) myAverage println
list("nan") myAverage