//
//  LoginViewController.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtPass : UITextField!
    
    @IBAction func login(sender: UIButton){
        
        if txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && txtPass.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            
            let alert = UIAlertController(title: "Error", message: "Username and Passwrod cannot be left blank.", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
        else if txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            
            let alert = UIAlertController(title: "Error", message: "Username cannot be left blank.", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
        else if txtPass.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            
            let alert = UIAlertController(title: "Error", message: "Password cannot be left blank.", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
        else{
            let mainDelegate = UIApplication.shared.delegate as! AppDelegate
            let user : UserInfo = UserInfo()
            
            user.UserName = txtName.text!
            user.Password = txtPass.text!
            
            user.Saveuser(Name: txtName.text!, Password: txtPass.text!, Hero1: 1, Hero2: 1, Hero3: 1, Hero4: 1, Weapon1: 0, Weapon2: 0, Weapon3: 0, Weapon4: 0, Armour1: 0, Armour2: 0, Armour3: 0, Armour4: 0)
            
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
