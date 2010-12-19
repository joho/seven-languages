List myAverage := method(
  sum := 0
  for(i, 0, self size - 1,
    sum = self at(i) + sum
  )
  sum / self size
)

list(1, 2, 3, 4, 5) myAverage println
