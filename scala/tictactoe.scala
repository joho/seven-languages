class Board(val top_row: Array[String], val middle_row: Array[String], val bottom_row: Array[String]) {
  def winner(): String  = {
    if(winsRows("X") || winsCols("X") || winsDiags("X")) {
      "X"
    } else if(winsRows("O") || winsCols("O") || winsDiags("O")) {
      "O"
    } else {
      ""
    }
  }

  def winsRows(letter: String): Boolean = {
    winCells(top_row, letter) || winCells(middle_row, letter) || winCells(bottom_row, letter)
  }

  def winCells(cells: Array[String], letter: String): Boolean = {
    cells(0) == letter && cells(1) == letter && cells(2) == letter
  }

  def winsCols(letter: String): Boolean = {      
    var winning = false
    for(col_number <- 0 to 2) {
      var column = Array(top_row(col_number), middle_row(col_number), bottom_row(col_number))
      winning = winning || winCells(column, letter)
    }
    winning
  }
  
  def winsDiags(letter: String): Boolean = {
    winCells(Array(top_row(0), middle_row(1), bottom_row(2)), letter) || 
    winCells(Array(top_row(2), middle_row(1), bottom_row(0)), letter)
  }
}

// test code below

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

