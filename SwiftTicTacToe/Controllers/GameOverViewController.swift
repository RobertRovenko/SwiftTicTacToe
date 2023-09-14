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
    
    var winnerName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SoundManager.shared.playSound(named: "winsound")
        
        //display the winnername
        if let winnerName = winnerName {
                  lblWinnerName.text = "\(winnerName) wins!"
              } else {
                  lblWinnerName.text = "It's a draw!"
              }
    
    }
    
    @IBAction func btnRematch(_ sender: Any) {
        SoundManager.shared.playSound(named: "menusound")
        self.dismiss(animated: true, completion: nil)
    }
    

}
