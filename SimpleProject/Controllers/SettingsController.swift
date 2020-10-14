//
//  SettingsController.swift
//  SimpleProject
//


import UIKit

class SettingsController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    // MARK: - Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helper Functions
    
   func configureUI() {
    view.backgroundColor = .systemBackground
    
    let navBar = UINavigationBarAppearance()
    navBar.backgroundColor = .darkGray
    navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    self.navigationController?.navigationBar.standardAppearance = navBar
    self.navigationController?.navigationBar.scrollEdgeAppearance = navBar
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Settings"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-delete-30").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        
        
    }
    
    
    
    
    
    
}
