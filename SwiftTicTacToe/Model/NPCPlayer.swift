//
//  NPCPlayer.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-16.
//

import Foundation

class NPCPlayer {
    func makeMove(game: TicTacToeGame) -> Int? {
        // Check if the game is still ongoing
        guard !game.isBoardFull() && game.checkForWin() == nil else {
            return nil
        }

        // Find available moves (empty squares)
        let availableMoves = game.getAvailableMoves()

        // Randomly choose a move from available moves
        if let randomIndex = availableMoves.randomElement() {
            return randomIndex
        }

        return nil // No available moves
    }
}
