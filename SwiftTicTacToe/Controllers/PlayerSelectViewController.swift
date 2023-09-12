//
//  StartGameViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-10.
//

import UIKit

class PlayerSelectViewController: UIViewController {

    @IBOutlet weak var btn1Player: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.black
        if let customFont = UIFont(name: "MarkerFelt-Thin", size: 20.0) {
               // Create a custom back button with the custom font
               let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
               backButton.setTitleTextAttributes([NSAttributedString.Key.font: customFont], for: .normal)

               // Assign the custom back button to the navigation item
               navigationItem.backBarButtonItem = backButton
           }
        //self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn1Player(_ sender: Any) {
        performSegue(withIdentifier: "GameSegue", sender: self)
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
