//
//  GameOverViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-14.
//

import UIKit

class GameOverViewController: UIViewController {

  
    @IBOutlet weak var btnRematch: UIButton!
    @IBOutlet weak var lblWinnerName: UILabel!
    @IBOutlet weak var lblPlayerOneName: UILabel!
    @IBOutlet weak var lblPlayerTwoName: UILabel!
    @IBOutlet weak var lblPlayerOneScore: UILabel!
    @IBOutlet weak var lblPlayer2Score: UILabel!
    @IBOutlet weak var btnMainMenu: UIButton!
    
    var winnerName: String?
    var player1Name: String?
    var player2Name: String?
    var player1Counter: Int = 0
    var player2Counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Play "winsound"
        SoundManager.shared.playSound(named: "winsound")

        //display the winnername
        if let winnerName = winnerName {
                  lblWinnerName.text = "\(winnerName) wins!"
              } else {
                  lblWinnerName.text = "It's a draw!"
              }
    
        lblPlayerOneName.text = "\(player1Name ?? "Player 1")"
        lblPlayerTwoName.text = "\(player2Name ?? "Player 2")"
        lblPlayerOneScore.text = "Score: \(player1Counter)"
        lblPlayer2Score.text = "Score: \(player2Counter)"
        
    }
    
  
    @IBAction func btnRematch(_ sender: Any) {
        SoundManager.shared.playSound(named: "menusound")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnMainMenu(_ sender: Any) {
        
     
    }
    
    
   
    
}
