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
    
    
    @IBOutlet var lblArrow: [UILabel]!
    
    var labelAnimator: ArrowAnimation?
    var imageViewAnimator: ImageViewAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundMusic.shared.start()
           
        labelAnimator = ArrowAnimation(labels: lblArrow)
        labelAnimator?.startAnimating()
         
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
    
   

    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)

           labelAnimator?.stopAnimating()
       }
    
    

    //preventing memoryleaks
      deinit {
          NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
      }
    override func viewWillAppear(_ animated: Bool) {
        
        labelAnimator?.startAnimating()
        
            super.viewWillAppear(animated)
            BackgroundMusic.shared.startBackgroundAudio()
        
        }
    
    @IBAction func BtnPlay(_ sender: UIButton) {
        
        SoundManager.shared.playSound(named: "menusound")
        BackgroundMusic.shared.stopBackgroundAudio()

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
               BackgroundMusic.shared.stopBackgroundAudio()
               UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
           }
           alert.addAction(quitAction)

           //present = show the alert
           present(alert, animated: true, completion: nil)
    }
   
}
