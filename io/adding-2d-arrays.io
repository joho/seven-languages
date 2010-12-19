array := list(
  list(1, 2, 3, 4, 5),
  list(10, 20, 30, 40, 50))

sum := 0
for(i, 0, array size - 1,
  for(j, 0, array at(i) size - 1,
    sum = array at(i) at(j) + sum
  )
)

sum println
