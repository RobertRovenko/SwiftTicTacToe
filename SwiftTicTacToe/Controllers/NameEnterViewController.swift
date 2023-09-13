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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //if there is one or two players
        
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
              
               txtFieldPlayer1.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer1.layer.borderWidth = 0.0
               txtFieldPlayer1.layer.cornerRadius = 0.0

              
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
              
               txtFieldPlayer2.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer2.layer.borderWidth = 1.0
               txtFieldPlayer1.layer.borderColor = UIColor.black.cgColor
               txtFieldPlayer1.layer.borderWidth = 1.0

              
               performSegue(withIdentifier: "GameSegue", sender: self)
           }
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
