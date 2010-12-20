squareBrackets := method(
  r := List clone
  call message arguments foreach(arg,
    r append(arg)
  )
  r
)

myList := [1, 2, 3, 4, 5]

myList println
