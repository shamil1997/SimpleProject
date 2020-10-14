//
//  SignUpController.swift
//  SimpleProject
//


import UIKit
import Firebase

class SignUpController: UIViewController {

    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var emailText: UILabel!
    
    var email = String()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailText.text = email
        signUp.addTarget(self, action: #selector(signUpButton), for: .touchUpInside)

    }
    

    

    // MARK: - Selectors
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        guard let password = passwordTextField.text,
                // use Swift's ability to infer the type here (and a couple other places)
                case let finalPassword = password.trimmingCharacters(in: .whitespacesAndNewlines),
                Utilities.isPasswordValid(finalPassword) else {
                // If we get here then either the password is null
                // or the password is not valid
                print("Password is not valid")

                // we need to display the alert, I'll move that into another function
                showPasswordInvalidAlert()

                return
            }

            // If we get here the password is valid
            print("Password is valid:", finalPassword)

        
        createUser(withEmail: email, password: password)
    }
        
    func showPasswordInvalidAlert() {
        // this is an alert not an action sheet
        let alert = UIAlertController(title: "", message: "Please make sure your password is at least six characters, includes at least one number or special character, and is not a commonly used password.", preferredStyle: .actionSheet)
        // this is not a destructive action
        let okAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
   
    // MARK: - API
    
    func createUser(withEmail email:String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("Failed to sign up", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else {return}
            
            let values = ["email": email]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                
                if let error = error {
                    print("Falied to update", error.localizedDescription)
                    return
                }
                let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
                
                guard let controller = mainStoryBoard.instantiateViewController(withIdentifier: "SubsViewController") as? SubsViewController else {
                    print("Error")
                    return
                }
                
                self.navigationController?.pushViewController(controller, animated: true)
                
               // self.present(controller, animated: true, completion: nil)

                
            
            })
        }
        
        
    }
}
