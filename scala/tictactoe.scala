class Board(val top_row: Array[String], val middle_row: Array[String], val bottom_row: Array[String]) {
  def winner(): String {
    if(winsRows("X") || winsColumns("X") || winsDiags("X")) {
      "X"
    } else if(winsRows("Y") || winsColumns("Y") || winsDiags("Y")) {
      "Y"
    } else {
      ""
    }
  }

  def winsRows(letter: String): Boolean {
    false
  }

  def winsCols(letter: String): Boolean {
    false
  }
  
  def winsDiags(letter: String): Boolean {
    false
  }
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

object GameTester {
  def test(gameName: String, board: Board, expectedWinner: String) {
    if(board.winner() == expectedWinner) {
      println(gameName + " passed test")
    }
    else {
      println(gameName + " failed. expected " + expectedWinner + " but got " + board.winner)
    }
  }
}

GameTester.test("x wins row", x_wins_row, "X")
GameTester.test("o wins col", o_wins_column, "O")
GameTester.test("x wins diag", x_wins_diag, "X")
GameTester.test("tie", tie, "")

