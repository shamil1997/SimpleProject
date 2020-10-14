//
//  LoginController.swift
//  SimpleProject
//


import UIKit
import Firebase


class LoginController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var emailTextField: UILabel!
    
    
    var email = String()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.text = email
    }
    

    
    // MARK: - Selectors
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        guard let password = passwordTextField.text else {return}
        
        let finalPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
            
        //Password Validation and Alert
            if Utilities.isPasswordValid(finalPassword) == true {
        
        print("Password is Valid")
        }
                else
        {
        print("Password is not Valid")
            let myAlert = UIAlertController(title:"",message:"Please make sure your password is at least six characters, includes at least one number or special character, and is not a commonly used password.",preferredStyle:UIAlertController.Style.actionSheet)
            let okAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
        return
        }
        
        
        loginUserIn(withEmail: email, password: password)
        
    }
    
    // MARK: - API
    
    func loginUserIn(withEmail email:String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        
        if let error = error {
            print("Failed to sign in", error.localizedDescription)
            return
        }
        print("Success Log In")
        
    }
    
}

}
