//
//  StartGameViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-10.
//

import UIKit

class PlayerSelectViewController: UIViewController {
    
    @IBOutlet weak var btn1Player: UIButton!
    @IBOutlet weak var btn2Player: UIButton!
    @IBOutlet var playerSelectSymbol: [UILabel]!
    
    let ONE_PLAYER_SEGUE = "1PlayerSegue"
    let TWO_PLAYER_SEGUE = "2PlayerSegue"
    
    
    var labelAnimator: ArrowAnimation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelAnimator = ArrowAnimation(labels: playerSelectSymbol)
        labelAnimator?.startAnimating()
        
        navigationController?.navigationBar.tintColor = UIColor.black
        if let customFont = UIFont(name: "MarkerFelt-Thin", size: 20.0) {
            //adding a custom font to my back button
            let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
            backButton.setTitleTextAttributes([NSAttributedString.Key.font: customFont], for: .normal)
            
            //connecting my font with my button
            navigationItem.backBarButtonItem = backButton
        }
        
    }
    
    
    @IBAction func btn1Player(_ sender: Any) {
        
        SoundManager.shared.playSound(named: "menusound")
       
    }
    
    @IBAction func btn2Player(_ sender: Any) {
        
        SoundManager.shared.playSound(named: "menusound")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            labelAnimator?.startAnimating()
        }

    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)

           labelAnimator?.stopAnimating()
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ONE_PLAYER_SEGUE {
            if let destinationVC = segue.destination as? NameEnterViewController {
                destinationVC.shouldHidePlayer2 = true
            }
        }
        if segue.identifier == TWO_PLAYER_SEGUE {
            if let destinationVC = segue.destination as? NameEnterViewController {
                destinationVC.shouldHidePlayer1 = true
            }
        }
        
    }

}
