val strings = List("First string", "Second string", "Third String", "Fourth String")

val total_length = strings.foldLeft(0)((sum, string) => sum + string.length)

println(total_length)
