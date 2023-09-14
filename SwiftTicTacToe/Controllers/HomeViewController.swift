//
//  HomeViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-10.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var BtnPlay: UIButton!
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var btnQuit: UIButton!
    
    var imageViewAnimator: ImageViewAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewAnimator = ImageViewAnimator(imageView: titleImageView)
             imageViewAnimator?.startAnimating()
        
        if let customFont = UIFont(name: "MarkerFelt-Thin", size: 20.0) {
               //Custom font to the backbutton
               let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
               backButton.setTitleTextAttributes([NSAttributedString.Key.font: customFont], for: .normal)

               //Assign the back button to the navigation item
               navigationItem.backBarButtonItem = backButton
           }
       
    }
    
    
    @IBAction func BtnPlay(_ sender: UIButton) {
        
        SoundManager.shared.playSound(named: "menusound")

        performSegue(withIdentifier: "PlayerSelectSegue", sender: self)
        
    }
    
    @IBAction func btnQuit(_ sender: Any) {
        let alert = UIAlertController(title: "Exit TicTacToe?", message: "Are you sure you want to quit?", preferredStyle: .alert)

           //CancelButton
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           alert.addAction(cancelAction)

           //QuitButton
           let quitAction = UIAlertAction(title: "Quit", style: .destructive) { _ in
               //quit the app
               UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
           }
           alert.addAction(quitAction)

           //present = show the alert
           present(alert, animated: true, completion: nil)
    }
   
}
