//
//  ContainerViewController.swift
//  SimpleProject
//


import UIKit
import Firebase

class ContainerViewController: UIViewController {
    
    // MARK: - Properties
    var sideBarViewController: SideBarViewController!
    var centerContrller: UIViewController!
    var isExpanded = false

    
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeViewController()
  
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
        
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return.slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Handlers

    func configureHomeViewController() {
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        centerContrller = UINavigationController(rootViewController: homeViewController)
        
        view.addSubview(centerContrller.view)
        addChild(centerContrller)
        centerContrller.didMove(toParent: self)
    }
    
    func configureSideBarViewController() {
        if sideBarViewController == nil {
            // add our menu controller here
            sideBarViewController = SideBarViewController()
            sideBarViewController.delegate = self
            view.insertSubview(sideBarViewController.view, at: 0)
            addChild(sideBarViewController)
            sideBarViewController.didMove(toParent: self)
      
        }
        
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerContrller.view.frame.origin.x = self.centerContrller.view.frame.width - 80
            }, completion: nil)
            
        } else {
            // hide menu
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerContrller.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption {
        case .Simple:
            print("Show Simple")
        case .Favorites:
            print("Show Favorites")
        case .Ranking:
            print("Show Ranking")
        case .Settings:
            let controller = SettingsController()
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        case .LogOut:
            let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in self.signOut()
                
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    func signOut() {
        
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)

        } catch let error {
            print("Failed to sign out with error",error)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
}


extension ContainerViewController: HomeControllerDelegate{
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
            if !isExpanded {
                configureSideBarViewController()
            }
            
            isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
}
