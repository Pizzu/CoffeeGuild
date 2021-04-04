//
//  ErrorHandling.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 4/4/21.
//

import SwiftUI
import Firebase

struct FirebaseErrorHandling {
    
    func handleFirebaseAuthError(error: Error) -> String {
        guard let errorCode = AuthErrorCode(rawValue: error._code) else {return ""}
        switch errorCode {
        case .emailAlreadyInUse:
            return "The email is already in use with another account. Pick another email."
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again."
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email."
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password or email is incorrect."
        default:
            return "Sorry, something went wrong."
        }
    }
    
}



enum ValidationError : LocalizedError {
    case emptyValue
    
    var errorDescription: String? {
        switch self {
        case .emptyValue:
            return "All fields must not be empty."
        }
        
    }
}
