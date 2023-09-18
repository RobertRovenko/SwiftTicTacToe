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
    @IBOutlet weak var lblPlayer2Counter: UILabel!
    @IBOutlet weak var lblPlayerOneCounter: UILabel!
    @IBOutlet weak var lblPlayerOneName: UILabel!
    @IBOutlet weak var lblPlayer2Name: UILabel!
    //Outlet collection with buttons
    @IBOutlet var boardButtons: [UIButton]!
    
    var player1Name: String?
    var player2Name: String?
    var winnerName: String?
    var player1Counter = 0
    var player2Counter = 0
    
    var winningSignal: [Int]?
    
    var isPlayerTurn = true
    var isGameOver = false
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

    func handleMove(button: UIButton) {
        let index = button.tag

        
        //check if the button is occupied
        if ticTacToeGame.board[index] != nil {
            // The button is already occupied, do nothing and return
            return
        }
        
        if isGameOver || ticTacToeGame.board[index] != nil {
               // The game is over or the button is already occupied, do nothing and return
               return
           }

        //Disable user interaction during NPC move
        setButtonUserInteraction(enabled: false)

        //Making a move for the current player
        if ticTacToeGame.makeMove(at: index) {
            button.setTitle(ticTacToeGame.getCurrentPlayer().rawValue, for: .normal)

            lblUserTurn.text = (ticTacToeGame.getCurrentPlayer() == .X) ? player2Name : player1Name

            //Checking for a win
            if let winner = ticTacToeGame.checkForWin() {
                handleWin(winner: winner)
            } else if ticTacToeGame.isBoardFull() {
                handleDraw()
            }

            //Checking if NPCisActivated and if its the NPC turn
            if NPCisActivated && ticTacToeGame.getCurrentPlayer() == .X {
                // Introduce a delay of 2 seconds before the NPC player's move
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    // Create an instance of NPCPlayer
                    let npcPlayer = NPCPlayer()

                    //Make a move for the NPC
                    if let npcMove = npcPlayer.makeMove(game: self.ticTacToeGame) {
                        //Placing the NPC symbol on the UI
                        let npcButton = self.boardButtons[npcMove]
                        self.handleMove(button: npcButton)
                    }

                    //Enable user interaction after NPC moves
                    self.setButtonUserInteraction(enabled: true)
                }
            } else {
                //Enable user interaction after player incorrect or occupied move
                setButtonUserInteraction(enabled: true)
            }
        }
    }

    //Handling if there is a win
    func handleWin(winner: TicTacToeGame.Player) {
        
        
        if winner == .O {
            player1Counter += 1
            winnerName = player1Name
        } else {
            player2Counter += 1
            winnerName = player2Name
        }

        //Check if there are winning conditions for the highlight
        if let winningSignal = ticTacToeGame.winningSignal {
            highlightWinningMove(winningSignal: winningSignal)
        }

        //Delay navigating to the game over screen to display the win highlight
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.resetGame()
            self.performSegue(withIdentifier: "GameOver", sender: self)
        }
    }

    //incase of a draw
    func handleDraw() {
          
        //Setting the winnername to nil so it displays a draw
        winnerName = nil
        self.resetGame()
            
        performSegue(withIdentifier: "GameOver", sender: nil)
    }
    
    //Highlight func that marks the buttons with red to showcase a win
    func highlightWinningMove(winningSignal: [Int]) {
        isGameOver = true
        for index in winningSignal {
            let winningButton = boardButtons[index]
            
            UIView.animate(withDuration: 0.5, animations: {
                
                winningButton.backgroundColor = UIColor.systemOrange
                
            }) { (_) in
                UIView.animate(withDuration: 0.5, delay: 1.0, animations: {
                    //Reset the color
                    winningButton.backgroundColor = UIColor.white
                    
                })
            }
        }
    }


    //func to reset the board and add the scores
    func resetGame() {
        
        //Clear the game board in instance and clear button titles
        ticTacToeGame = TicTacToeGame()
        isGameOver = false
        lblUserTurn.text = player1Name
        lblPlayerOneCounter.text = "\(player1Counter)"
        lblPlayer2Counter.text = "\(player2Counter)"
        
        for button in boardButtons {
            button.setTitle(nil, for: .normal)
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0.0
           
        }
    }
    
    //Sending data with names and scores to GO Screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "GameOver" {
               
               if let gameOverVC = segue.destination as? GameOverViewController {
                   
                   gameOverVC.winnerName = self.winnerName
                   gameOverVC.player1Name = self.player1Name
                   gameOverVC.player2Name = self.player2Name
                   gameOverVC.player1Counter = self.player1Counter
                   gameOverVC.player2Counter = self.player2Counter
                   
               }
           }
       }
    
    
  
}

