import Foundation

class GameState: ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Ex
    @Published var oScore = 0
    @Published var xScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    
    
    
    init()
    {
        resetBoard()
    }
    
    func turnText() -> String
    {
        return turn == Tile.Ex ? "Turn: X" : "Turn: O"
    }
    
    func placeTile(_ row: Int,_ column: Int)
    {
        if(board[row][column].tile != Tile.Null)
        {
            return
        }
        
        board[row][column].tile = turn == Tile.Ex ? Tile.Ex : Tile.Ough
        
        
        if(checkWin())
        {
            if(turn == Tile.Ex)
            {
                xScore += 1
            }
            else
            {
                oScore += 1
            }
            let winner = turn == Tile.Ex ? "X's" : "O's"
            alertMessage = winner + " Win!"
            showAlert = true
        }
        else
        {
            turn = turn == Tile.Ex ? Tile.Ough : Tile.Ex
        }
        
        if(checkForDraw())
        {
            alertMessage = "Draw"
            showAlert = true
        }
    }
    
    func checkForDraw() -> Bool
    {
        for row in board
        {
            for cell in row
            {
                if cell.tile == Tile.Null
                {
                    return false
                }
            }
        }
        
        return true
    }
    
    func checkWin() -> Bool
    {
        // vertical victory
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0)
        {
            return true
        }
        if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1)
        {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2)
        {
            return true
        }
        
        // horizontal victory
        if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2)
        {
            return true
        }
        if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2)
        {
            return true
        }
        if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2)
        {
            return true
        }
        
        // diagonal victory
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2)
        {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0)
        {
            return true
        }
        
        
        return false
    }
    
    func isTurnTile(_ row: Int,_ column: Int) -> Bool
    {
        return board[row][column].tile == turn
    }
    
    func resetBoard()
    {
        var newBoard = [[Cell]]()
        
        for _ in 0...2
        {
            var row = [Cell]()
            for _ in 0...2
            {
                row.append(Cell(tile: Tile.Null))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
