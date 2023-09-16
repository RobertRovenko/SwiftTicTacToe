//
//  GameViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-10.
//

import UIKit

class GameViewController: UIViewController {

    var ticTacToeGame = TicTacToeGame()
   
    var isPlayerTurn = true
    @IBOutlet weak var lblUserTurn: UILabel!
    
    @IBOutlet weak var lblPlayer2Counter: UILabel!
    @IBOutlet weak var lblPlayerOneCounter: UILabel!
    @IBOutlet weak var lblPlayerOneName: UILabel!
   
    @IBOutlet weak var lblPlayer2Name: UILabel!
    
    //outlet collection
    @IBOutlet var boardButtons: [UIButton]!
    
    var player1Name: String?
    var player2Name: String?
    var winnerName: String?
    var player1Counter = 0
    var player2Counter = 0
    
    var winningIndices: [Int]?
    
    var NPCisActivated = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NPCisActivated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        lblPlayerOneName.text = player1Name ?? "Player 1"
        lblPlayer2Name.text = player2Name ?? "Player 2"
        lblUserTurn.text = player1Name
        
        lblPlayerOneCounter.text = "Score: \(player1Counter)"
        lblPlayer2Counter.text = "Score: \(player2Counter)"
       
    }
    
   
    @IBAction func boardButtonsTap(_ sender: UIButton) {
        SoundManager.shared.playSound(named: "clickbutton")
        handleMove(button: sender)
    }
    
    func setButtonUserInteraction(enabled: Bool) {
        for button in boardButtons {
            button.isUserInteractionEnabled = enabled
        }
    }


    // Inside GameViewController
    func handleMove(button: UIButton) {
        let index = button.tag

        // Disable user interaction for buttons during NPC's move
        setButtonUserInteraction(enabled: false)

        // Making a move for the current player
        if ticTacToeGame.makeMove(at: index) {
            button.setTitle(ticTacToeGame.getCurrentPlayer().rawValue, for: .normal)

            lblUserTurn.text = (ticTacToeGame.getCurrentPlayer() == .X) ? player2Name : player1Name

            // Check for win
            if let winner = ticTacToeGame.checkForWin() {
                handleWin(winner: winner)
            } else if ticTacToeGame.isBoardFull() {
                handleDraw()
            }

            // Check if NPCisActivated and it's the NPC player's turn
            if NPCisActivated && ticTacToeGame.getCurrentPlayer() == .X {
                // Introduce a delay of 2 seconds before the NPC player's move
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    // Create an instance of NPCPlayer
                    let npcPlayer = NPCPlayer()

                    // Make a move for the NPC player
                    if let npcMove = npcPlayer.makeMove(game: self.ticTacToeGame) {
                        // Simulate the NPC player's move on the UI
                        let npcButton = self.boardButtons[npcMove]
                        self.handleMove(button: npcButton)
                    }

                    // Enable user interaction for buttons after NPC's move
                    self.setButtonUserInteraction(enabled: true)
                }
            } else {
                // Enable user interaction for buttons after the player's move
                setButtonUserInteraction(enabled: true)
            }
        }
    }



    
    func handleWin(winner: TicTacToeGame.Player) {
        if winner == .O {
            player1Counter += 1
            winnerName = player1Name
        } else {
            player2Counter += 1
            winnerName = player2Name
        }

        // Check if there are winning indices
        if let winningIndices = ticTacToeGame.winningIndices {
            highlightWinningMove(winningIndices: winningIndices)
        }

        // Delay before navigating to the game over screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.resetGame()
            self.performSegue(withIdentifier: "GameOver", sender: self)
        }
    }






        func handleDraw() {
          
            //Setting the winnername to nil so it displays a draw
            winnerName = nil
           
            self.resetGame()
            
            performSegue(withIdentifier: "GameOver", sender: nil)
        }
    
    func highlightWinningMove(winningIndices: [Int]) {
        for index in winningIndices {
            let winningButton = boardButtons[index]
            UIView.animate(withDuration: 0.5, animations: {
                winningButton.backgroundColor = UIColor.red
            }) { (_) in
                UIView.animate(withDuration: 0.5, delay: 2.0, animations: {
                    winningButton.backgroundColor = UIColor.white // Restore the original color
                })
            }
        }
    }



    func resetGame() {
        //Clear the game board in instance and clear button titles
        ticTacToeGame = TicTacToeGame()
        lblUserTurn.text = player1Name
        lblPlayerOneCounter.text = "\(player1Counter)"
        lblPlayer2Counter.text = "\(player2Counter)"
        for button in boardButtons {
            button.setTitle(nil, for: .normal)
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0.0
           
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "GameOver" {
               if let gameOverVC = segue.destination as? GameOverViewController {
                   gameOverVC.winnerName = self.winnerName // Pass the winner's name
                   gameOverVC.player1Name = self.player1Name // Pass player 1's name
                    gameOverVC.player2Name = self.player2Name // Pass player 2's name
                    gameOverVC.player1Counter = self.player1Counter // Pass player 1's score
                    gameOverVC.player2Counter = self.player2Counter // Pass player 2's score
               }
           }
       }
    
    
  
}

