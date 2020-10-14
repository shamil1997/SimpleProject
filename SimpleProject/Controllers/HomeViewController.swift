//
//  HomeViewController.swift
//  SimpleProject
//


import UIKit
import Firebase

class HomeViewController: UIViewController {

      // MARK: - Properties
    var delegate: HomeControllerDelegate?
      
      // MARK: - Init

      override func viewDidLoad() {
          super.viewDidLoad()

        view.backgroundColor = .white
        configureNavigationBar()
        handleNotAuthenticated()

      }
      
      // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    @objc func messagesView() {
       let messagesScreen = MessagesViewController()
       let navigationController = UINavigationController(rootViewController: messagesScreen)
       navigationController.modalPresentationStyle = .fullScreen
       present(navigationController, animated: true)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .default
    
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Marker Felt", size: 25)!,NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        navigationItem.title = "Simple"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-rounded-30").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(handleMenuToggle))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-chat-room-30").withRenderingMode(.alwaysOriginal) , style: .plain, target: self, action: #selector(messagesView))
        
    }
    
    // MARK: - API
    
    private func handleNotAuthenticated() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show log in
            let mainVC = MainViewController()
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: false)
        }
        
    }

 
    
    // MARK: - Helper Functions
    

}
