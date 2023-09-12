//
//  HomeViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-10.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var BtnPlay: UIButton!
    
    @IBOutlet weak var btnQuit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let customFont = UIFont(name: "MarkerFelt-Thin", size: 20.0) {
               // Create a custom back button with the custom font
               let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
               backButton.setTitleTextAttributes([NSAttributedString.Key.font: customFont], for: .normal)

               // Assign the custom back button to the navigation item
               navigationItem.backBarButtonItem = backButton
           }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BtnPlay(_ sender: UIButton) {
        
        performSegue(withIdentifier: "PlayerSelectSegue", sender: self)
        
    }
    
    @IBAction func btnQuit(_ sender: Any) {
        let alert = UIAlertController(title: "Exit TicTacToe?", message: "Are you sure you want to quit?", preferredStyle: .alert)

           // Add a "Cancel" button to the alert
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           alert.addAction(cancelAction)

           // Add a "Quit" button to the alert
           let quitAction = UIAlertAction(title: "Quit", style: .destructive) { _ in
               // Quit the app
               UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
           }
           alert.addAction(quitAction)

           // Present the alert
           present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
