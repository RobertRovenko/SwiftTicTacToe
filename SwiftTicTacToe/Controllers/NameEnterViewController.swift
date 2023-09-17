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
        
        if txtFieldPlayer1.text?.isEmpty ?? true {
              
            //if a textfield is empty
            txtFieldPlayer1.layer.borderColor = UIColor.red.cgColor
            txtFieldPlayer1.layer.borderWidth = 1.0
            txtFieldPlayer1.layer.cornerRadius = 0.0
            
           } else {
               player1Name = txtFieldPlayer1.text
               player2Name = "NPC"
               NPCisActivated = true
               txtFieldPlayer1.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer1.layer.borderWidth = 0.0
               txtFieldPlayer1.layer.cornerRadius = 0.0

               SoundManager.shared.playSound(named: "menusound")
               performSegue(withIdentifier: "GameSegue", sender: self)
           }
        
    }
    
    @IBAction func btn2ConfirmName(_ sender: UIButton) {
        
        //if a textfield is empty
        
        if txtFieldPlayer2.text?.isEmpty == true || txtFieldPlayer1.text?.isEmpty == true{
              
            txtFieldPlayer1.layer.borderColor = UIColor.red.cgColor
            txtFieldPlayer1.layer.borderWidth = 2.0
            txtFieldPlayer2.layer.borderColor = UIColor.red.cgColor
            txtFieldPlayer2.layer.borderWidth = 2.0
            
           } else {
              
               player1Name = txtFieldPlayer1.text
               player2Name = txtFieldPlayer2.text
               txtFieldPlayer2.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer2.layer.borderWidth = 1.0
               txtFieldPlayer1.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer1.layer.borderWidth = 1.0

               SoundManager.shared.playSound(named: "menusound")
               performSegue(withIdentifier: "GameSegue", sender: self)
           }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameSegue" {
            if let gameViewController = segue.destination as? GameViewController {
                gameViewController.player1Name = player1Name
                gameViewController.player2Name = player2Name
                gameViewController.NPCisActivated = NPCisActivated
            }
        }
    }
   
}
