//
//  GameViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-10.
//

import UIKit

class GameViewController: UIViewController {

    var ticTacToeGame = TicTacToeGame()
    
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
      
    }
    
   
    
    @IBAction func a1(_ sender: UIButton) {
        handleMove(button: sender)
    }
   
     @IBAction func a2(_ sender: UIButton) {
         handleMove(button: sender)
     }
    
    @IBAction func a3(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
    @IBAction func b1(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
    @IBAction func b2(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
    @IBAction func b3(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
    @IBAction func c1(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
    @IBAction func c2(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
    @IBAction func c3(_ sender: UIButton) {
        handleMove(button: sender)
    }
    
    func handleMove(button: UIButton) {
           let index = button.tag

           //Making a move
           if ticTacToeGame.makeMove(at: index) {
               //Update button title
               button.setTitle(ticTacToeGame.currentPlayer.rawValue, for: .normal)

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

        if winner == .X {
            winnerSymbol = "X"
        } else {
            winnerSymbol = "O"
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
        for button in [a1, a2, a3, b1, b2, b3, c1, c2, c3] {
            if let unwrappedButton = button {
                unwrappedButton.setTitle(nil, for: .normal)
                unwrappedButton.layer.borderColor = UIColor.clear.cgColor
                unwrappedButton.layer.borderWidth = 0.0
            }
        }
    }
    
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

