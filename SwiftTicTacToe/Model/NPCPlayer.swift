//
//  NPCPlayer.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-16.
//

import Foundation

class NPCPlayer {
    func makeMove(game: TicTacToeGame) -> Int? {
        
        //Checking if the game is still going on
        guard !game.isBoardFull() && game.checkForWin() == nil else {
            return nil
        }

        //Find empty buttos
        let availableMoves = game.getAvailableMoves()

        //Randomly choose a move from available buttons
        if let randomIndex = availableMoves.randomElement() {
            return randomIndex
        }

        //No available moves
        return nil
    }
}
