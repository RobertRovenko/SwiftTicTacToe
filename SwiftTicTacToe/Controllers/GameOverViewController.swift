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
    
    var paused = false
    var winnerName: String?
    var player1Name: String?
    var player2Name: String?
    var player1Counter: Int = 0
    var player2Counter: Int = 0
    
    let attributes: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "MarkerFelt-Thin", size: 36.0) ?? UIFont.systemFont(ofSize: 36.0),
        .foregroundColor: UIColor.black
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var attributedText = NSAttributedString(string: "REMATCH", attributes: attributes)
        attributedText = NSAttributedString(string: "REMATCH", attributes: attributes)
        btnRematch.setAttributedTitle(attributedText, for: .normal)
        
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
        
        if paused == true{
            
            lblWinnerName.text = "Game Paused"
            attributedText = NSAttributedString(string: "Continue", attributes: attributes)
            // Set the new attributed string as the button's title
            btnRematch.setAttributedTitle(attributedText, for: .normal)
            SoundManager.shared.playSound(named: "pausesound")
            paused = false

        }else{
            // Play "winsound"
            SoundManager.shared.playSound(named: "winsound")
        }
       
    }
    
  
    @IBAction func btnRematch(_ sender: Any) {
        SoundManager.shared.playSound(named: "pausesound")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnMainMenu(_ sender: Any) {
        
        
        //Dismiss and then pop to the root ViewController
        self.dismiss(animated: false) {
                // Navigate back to the root view controller
                if let sceneDelegate = UIApplication.shared.connectedScenes
                    .first?.delegate as? SceneDelegate {
                    if let window = sceneDelegate.window {
                        if let rootViewController = window.rootViewController {
                            if let navigationController = rootViewController as? UINavigationController {
                                navigationController.popToRootViewController(animated: false)
                            }
                        }
                    }
                }
            }
    }
}
