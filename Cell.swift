//
//  Cell.swift
//  TicTacToeUI
//
//  Created by Joey George on 1/1/23.
//

import Foundation
import SwiftUI

struct Cell
{
    var tile: Tile
    
    func revealTile() -> String
    {
        switch(tile)
        {
        case Tile.Ough:
            return "O"
        case Tile.Ex:
            return "X"
        default:
            return ""
        }
    }
    
    func tileColor() -> Color
    {
        switch(tile)
        {
        case Tile.Ough:
            return Color.red
        case Tile.Ex:
            return Color.black
        default:
            return Color.black
        }
    }
}

enum Tile
{
    case Ough
    case Ex
    case Null
}
