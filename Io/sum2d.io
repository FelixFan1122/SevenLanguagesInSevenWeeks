sum2d := method(array, 
    s := 0;
    for(i, 0, array size - 1, s = s + array at(i) sum);
    s
)

sum2d(list(list(1, 2, 3), list(4, 5))) println