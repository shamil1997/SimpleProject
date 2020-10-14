//
//  MenuOption.swift
//  SimpleProject
//



import UIKit
enum MenuOption: Int, CustomStringConvertible {
    
    case Simple
    case Favorites
    case Ranking
    case Settings
    case LogOut
    
    var description: String {
        switch self {
            
        case .Simple: return "Simple"
        case .Favorites: return "Favorites"
        case .Ranking: return "Ranking"
        case .Settings: return "Settings"
        case .LogOut: return "Log Out"

        }
    }
    
    var image: UIImage {
          switch self {
              
          case .Simple: return #imageLiteral(resourceName: "icons8-create-50")
          case .Favorites: return #imageLiteral(resourceName: "icons8-star-50")
          case .Ranking: return #imageLiteral(resourceName: "icons8-leaderboard-50")
          case .Settings: return #imageLiteral(resourceName: "icons8-gear-50")
          case .LogOut: return #imageLiteral(resourceName: "icons8-power-off-button-50")

          }
      }
}
