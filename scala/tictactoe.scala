class Board(val top_row: Array[String], val middle_row: Array[String], val bottom_row: Array[String]) {
}

val x_wins_row = new Board(Array("X", "X", "X"),
                           Array("O", "O", "" ),
                           Array("O", "" , "" ))

val o_wins_column = new Board(Array("O", "X", "X"),
                              Array("O", "O", "" ),
                              Array("O", "X", ""))

val x_wins_diag = new Board(Array("X", "O", "X"),
                            Array("O", "X", "" ),
                            Array("O", "O", "X"))

val tie = new Board(Array("X", "O", "X"),
                    Array("O", "O", "X"),
                    Array("X", "X", "O"))


