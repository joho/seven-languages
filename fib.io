fib_recursive := method(n,
  if(n == 0 or n == 1, 
    n, 
    fib_recursive(n - 1) + fib_recursive(n - 2)
  )
)

fib_iterative := method(n,
  previous := -1
  result := 1
  for(i, 0, n, 
    sum := previous + result
    previous = result
    result = sum
  )
  result 
)

"recursive" println
for(i, 1, 10, fib_recursive(i) println)

"iterative" println
for(i, 1, 10, fib_iterative(i) println)

