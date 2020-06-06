2dlist := Object clone;

2dlist dim := method(x, y,
    self matrix := list();
    self matrix preallocateToSize(y);
    for(i, 1, y,
        row := list();
        row preallocateToSize(x);
        for(j, 1, x, row append(nil));
        self matrix append(row)
    )
)

2dlist set := method(x, y, value, self matrix at(y) atPut(x, value));

2dlist get := method(x, y, self matrix at(y) at(x));

2dlist transpose := method(
    transposed := 2dlist clone;
    transposed dim(self matrix size, self matrix at(0) size);
    self matrix foreach(y, row, row foreach(x, v, transposed set(y, x, v)));
    transposed;
)

2dlist writeToFile := method(fileName, 
    f := File with(fileName);
    f remove;
    f openForUpdating;
    self matrix foreach(row, 
        line := "" asMutable;
        row foreach(v, 
            if(v != nil, line appendSeq(v asString));
            line appendSeq(", ")
        );
        f write(line exclusiveSlice(0, -2) appendSeq("\n"))
    );
    f close;
)

2dlist readFromFile := method(fileName,
    f := File with(fileName);
    f openForReading;
    f foreachLine(y, line, line split(",") foreach(x, v, self set(x, y, v asNumber)));
    f close;
)

array := 2dlist clone;
array dim(3, 4);
array set(1, 2, 10);
array get(1, 2) println;
trans := array transpose;
trans get(2, 1) println;
array writeToFile("2dlist.data");
fromFile := 2dlist clone;
fromFile dim(3, 4);
fromFile readFromFile("2dlist.data");
fromFile get(1, 2) println