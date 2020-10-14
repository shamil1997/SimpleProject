//
//  EmailControllerLG.swift
//  SimpleProject
//


import UIKit

class EmailControllerLG: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var firstAction: UIButton!
    
    

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Selectors
    
    @IBAction func firstActionButton(_ sender: UIButton) {
        
      guard let email = emailTextField.text else {return}
        
        let finalEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
        //Email Validation and Alert
            if Utilities.isValidEmail(userEmail: finalEmail) == true {
        
        print("Email is Valid")
        }
                else
        {
        print("Email is not Valid")
            let myAlert = UIAlertController(title:"",message:"Sorry, your email address is invalid. Please enter a valid email using this format: yourname@example.com",preferredStyle:UIAlertController.Style.actionSheet)
            let okAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
        return
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
           
        if segue.identifier == "segue2" {
            let destinatinationController = segue.destination as! LoginController
            destinatinationController.email = emailTextField.text!
            
            
        }
    
       }


}
