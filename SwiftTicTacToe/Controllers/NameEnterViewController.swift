//
//  NameEnterViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-12.
//

import UIKit

class NameEnterViewController: UIViewController {

    @IBOutlet weak var lblPlayer2: UILabel!
    @IBOutlet weak var txtFieldPlayer2: UITextField!
    @IBOutlet weak var txtFieldPlayer1: UITextField!
    @IBOutlet weak var btn2ConfirmName: UIButton!
    @IBOutlet weak var btnConfirmName: UIButton!
    
    let GAME_SEGUE = "GameSegue"
    
    var shouldHidePlayer2 = false
    var shouldHidePlayer1 = false
    
    var player1Name: String?
    var player2Name: String?
    
    var NPCisActivated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if there is one or two players ui change
        if shouldHidePlayer1 {
            btnConfirmName.isHidden = true
            
        }
        
        if shouldHidePlayer2 {
            btn2ConfirmName.isHidden = true
            txtFieldPlayer2.isHidden = true
            lblPlayer2.isHidden = true
            
           }
    }

    @IBAction func btnConfirmName(_ sender: UIButton) {
        
        if let playerName = txtFieldPlayer1.text, !playerName.isEmpty {
               //Names longer than 9 cuts off
               player1Name = String(playerName.prefix(9))
               player2Name = "NPC"
               NPCisActivated = true
               txtFieldPlayer1.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer1.layer.borderWidth = 0.0
               txtFieldPlayer1.layer.cornerRadius = 0.0
               SoundManager.shared.playSound(named: "menusound")
               performSegue(withIdentifier: GAME_SEGUE, sender: self)
           } else {
               txtFieldPlayer1.layer.borderColor = UIColor.red.cgColor
               txtFieldPlayer1.layer.borderWidth = 1.0
               txtFieldPlayer1.layer.cornerRadius = 0.0
           }
    }
    
    @IBAction func btn2ConfirmName(_ sender: UIButton) {
        //if a textfield is empty
        if let player1 = txtFieldPlayer1.text, let player2 = txtFieldPlayer2.text,
               !player1.isEmpty, !player2.isEmpty {
               //Names longer than 9 Chars will be cut
               player1Name = String(player1.prefix(9))
               player2Name = String(player2.prefix(9))
               txtFieldPlayer2.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer2.layer.borderWidth = 1.0
               txtFieldPlayer1.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer1.layer.borderWidth = 1.0
               SoundManager.shared.playSound(named: "menusound")
               performSegue(withIdentifier: GAME_SEGUE, sender: self)
           } else {
               txtFieldPlayer1.layer.borderColor = UIColor.red.cgColor
               txtFieldPlayer1.layer.borderWidth = 2.0
               txtFieldPlayer2.layer.borderColor = UIColor.red.cgColor
               txtFieldPlayer2.layer.borderWidth = 2.0
           }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == GAME_SEGUE {
            if let gameViewController = segue.destination as? GameViewController {
                gameViewController.player1Name = player1Name
                gameViewController.player2Name = player2Name
                gameViewController.NPCisActivated = NPCisActivated
            }
        }
    }
   
}
