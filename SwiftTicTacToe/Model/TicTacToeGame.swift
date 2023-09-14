//
//  TicTacToeGame.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-13.
//

import Foundation

class TicTacToeGame {
    enum Player: String {
        case O = "O"
        case X = "X"
       
    }

    private var board: [Player?]
    private(set) var currentPlayer: Player

    init() {
        board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        currentPlayer = .O
    }

    func getCurrentPlayer() -> Player {
        return currentPlayer
    }
    
    func makeMove(at index: Int) -> Bool {
            if index < 0 || index >= board.count || board[index] != nil {
                return false //No more moves
            }

        board[index] = currentPlayer
            currentPlayer = (currentPlayer == .X) ? .O : .X
            return true
        }
    func checkForWin() -> Player? {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], //rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], //columns
            [0, 4, 8], [2, 4, 6]             //diagonals
        ]

        for pattern in winPatterns {
            let a = pattern[0]
            let b = pattern[1]
            let c = pattern[2]

            if let playerA = board[a], let playerB = board[b], let playerC = board[c], playerA == playerB, playerB == playerC {
                return playerA
            }
        }

        return nil //No win yet
    }


    func isBoardFull() -> Bool {
        return !board.contains(nil)
    }
}
