//
//  MainViewController.swift
//  SimpleProject
//
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func loginTappedButton(_ sender: UIButton) {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let controller = mainStoryBoard.instantiateViewController(withIdentifier: "EmailControllerLG") as? EmailControllerLG else {
            print("Error")
            return
        }
        
        navigationController?.pushViewController(controller, animated: true)
        
        
    }
    

}
