//
//  GameViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-10.
//

import UIKit

class GameViewController: UIViewController {

    var ticTacToeGame = TicTacToeGame()

    @IBOutlet weak var lblUserTurn: UILabel!
    
    @IBOutlet weak var lblPlayerOneName: UILabel!
   
    @IBOutlet weak var lblPlayer2Name: UILabel!
    
    @IBOutlet var boardButtons: [UIButton]!
    
    var player1Name: String?
    var player2Name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        lblPlayerOneName.text = player1Name ?? "Player 1"
        lblPlayer2Name.text = player2Name ?? "Player 2"
        lblUserTurn.text = player1Name
      
    }
    
   
    @IBAction func boardButtonsTap(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
   
    
    func handleMove(button: UIButton) {
        let index = button.tag

        //Making a move
        if ticTacToeGame.makeMove(at: index) {
   
            button.setTitle(ticTacToeGame.getCurrentPlayer().rawValue, for: .normal)

          
            lblUserTurn.text = (ticTacToeGame.getCurrentPlayer() == .X) ? player2Name : player1Name

            //Check for win
            if let winner = ticTacToeGame.checkForWin() {
                handleWin(winner: winner)
            } else if ticTacToeGame.isBoardFull() {
                handleDraw()
            }
        }
    }

    
    func handleWin(winner: TicTacToeGame.Player) {
        var winnerSymbol: String

        if winner == .O {
            winnerSymbol = player1Name ?? "X"
        } else {
            winnerSymbol = player2Name ?? "O"
        }

        //Display a message for win
        let alertController = UIAlertController(
            title: "Game Over",
            message: "\(winnerSymbol) wins!",
            preferredStyle: .alert
        )

        let resetAction = UIAlertAction(
            title: "Play Again",
            style: .default
        ) { _ in
            self.resetGame()
        }

        alertController.addAction(resetAction)
        present(alertController, animated: true, completion: nil)
    }


        func handleDraw() {
            //Display a message for draw
            let alertController = UIAlertController(
                title: "Game Over",
                message: "It's a draw!",
                preferredStyle: .alert
            )

            let resetAction = UIAlertAction(
                title: "Play Again",
                style: .default
            ) { _ in
                self.resetGame()
            }

            alertController.addAction(resetAction)
            present(alertController, animated: true, completion: nil)
        }

    func resetGame() {
        //Clear the game board in instance
        ticTacToeGame = TicTacToeGame()

        //Clear the button titles
        for button in boardButtons {
            button.setTitle(nil, for: .normal)
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0.0
        }
    }
    
}

