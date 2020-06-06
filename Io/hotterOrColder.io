hotterOrColder := method(
    answer := Random value(0, 100) ceil
    stdIn := File standardInput
    stdIn openForReading
    guess := -1
    limit := 0
    while(limit < 11,
        guess = stdIn readLine asNumber
        if(guess == answer, "You win!" println;return)
        if(guess < answer, "Hotter" println)
        if(guess > answer, "Colder" println)
        limit = limit + 1
    )
    "Time's up!" println
)

hotterOrColder