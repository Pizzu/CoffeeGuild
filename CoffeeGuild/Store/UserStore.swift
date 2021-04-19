//
//  UserStore.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 17/3/21.
//

import SwiftUI
import Combine
import Firebase

class UserStore : ObservableObject {
    
    @Published var currentUser : User?
    @Published var isLogged : Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    
    private let auth : Auth = Auth.auth()
    private let db : Firestore = Firestore.firestore()
    private var firebaseErrorHandling : FirebaseErrorHandling = FirebaseErrorHandling()
    
    
    //Get Current User
    func getCurrentUser() {
        if let user = auth.currentUser {
            print("Logged")
            let userRef = self.db.collection("users").document(user.uid)
            userRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    do {
                        try self.currentUser = document.data(as: User.self)
                        print(self.currentUser!)
                        self.isLogged = true
                    } catch {
                        print("Not Logged")
                        self.currentUser = nil
                        self.isLogged = false
                    }
                } else {
                    print("Not Logged")
                    self.currentUser = nil
                    self.isLogged = false
                }
            }
        } else {
            print("Not Logged")
            self.currentUser = nil
            self.isLogged = false
        }
    }
    
    //Sign up and create user
    func signupUser(username: String, email: String, password: String, address: String, completion: @escaping (FireAuthResponse) -> Void) throws {
        guard !username.isEmpty || !email.isEmpty || !password.isEmpty || !address.isEmpty else {throw ValidationError.emptyValue}
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                let errorMessage = self.firebaseErrorHandling.handleFirebaseAuthError(error: error)
                DispatchQueue.main.async {
                    completion(FireAuthResponse(result: nil, errorMessage: errorMessage))
                }
            } else {
                let errorMessage = self.createUserDocument(username: username, address: address, result: result)
                if errorMessage != nil {
                    DispatchQueue.main.async {
                        completion(FireAuthResponse(result: nil, errorMessage: errorMessage))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(FireAuthResponse(result: result, errorMessage: nil))
                    }
                }
            }
        }
    }
    
    private func createUserDocument(username: String, address: String, result: AuthDataResult?) -> String? {
        if let user = result?.user {
            do {
                let _ = try self.db.collection("users").document(user.uid).setData(from: User(id: user.uid, username: username, email: user.email ?? "", address: address, profileImage: ""))
            } catch {
                return self.firebaseErrorHandling.handleFirebaseAuthError(error: error)
            }
        }
        return nil
    }
    
    
    //Sign in user
    func signinUser(email: String, password: String, completion: @escaping (FireAuthResponse) -> Void) throws {
        guard !email.isEmpty || !password.isEmpty else {throw ValidationError.emptyValue}
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                let errorMessage = self.firebaseErrorHandling.handleFirebaseAuthError(error: error)
                DispatchQueue.main.async {
                    completion(FireAuthResponse(result: nil, errorMessage: errorMessage))
                }
            } else {
                DispatchQueue.main.async {
                    completion(FireAuthResponse(result: result, errorMessage: nil))
                }
            }
        }
    }
    
    func updateUser() {
        
    }
    
    // Logout
    func logout() {
        do {
            try auth.signOut()
            self.isLogged = false
            self.currentUser = nil
        } catch {
            print(self.firebaseErrorHandling.handleFirebaseAuthError(error: error))
            self.isLogged = false
            self.currentUser = nil
        }
    }
    
    // Reset Password
    func resetPassword(with email : String, completion: @escaping (Error?) -> Void) throws {
        guard !email.isEmpty else {throw ValidationError.emptyValue}
        auth.sendPasswordReset(withEmail: email) { error in
            if error != nil {
                DispatchQueue.main.async {
                    completion(error)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
