//
//  NameEnterViewController.swift
//  SwiftTicTacToe
//
//  Created by Robert Falkbäck on 2023-09-12.
//

import UIKit

class NameEnterViewController: UIViewController {

    @IBOutlet weak var btnConfirmName: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnConfirmName(_ sender: UIButton) {
        
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
