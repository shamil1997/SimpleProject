//
//  Utilities.swift
//  SimpleProject
//


import Foundation
import UIKit

class Utilities {
    
    //  Password Validation Function
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    //  Email Validation Function
    
    static func isValidEmail(userEmail:String) -> Bool {
        
        let emailRegEx = "[A-Za-z0-9.%+-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@",emailRegEx).evaluate(with:userEmail)
    }
    
    
}
