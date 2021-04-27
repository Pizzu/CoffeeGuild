//
//  Apay.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 26/4/21.
//

import UIKit
import SwiftUI
import Stripe
import PassKit
import Firebase

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {
    
    private let db : Firestore = Firestore.firestore()
    private let auth : Auth = Auth.auth()
    private let functions : Functions = Functions.functions()
    
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var currentUser : User? = nil
    
    var completionHandler : PaymentCompletionHandler?

    func startPayment(for user: User?, totalAmount: Float, completion: @escaping PaymentCompletionHandler) {
        let merchantIdentifier = "merchant.com.CoffeeGuild"
        let paymentRequest = StripeAPI.paymentRequest(withMerchantIdentifier: merchantIdentifier, country: "US", currency: "USD")
        
        self.completionHandler = completion
        self.currentUser = user
        let amount = PKPaymentSummaryItem(label: "Coffee Guild, Inc", amount: NSDecimalNumber(value: totalAmount))
        print(amount.amount.floatValue)
        paymentSummaryItems = [amount]
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantCapabilities = .capability3DS
        
        if let applePayContext = STPApplePayContext(paymentRequest: paymentRequest, delegate: self) {
            applePayContext.presentApplePay()
        }
      }
    
}

/*
    PKPaymentAuthorizationControllerDelegate conformance.
*/
extension PaymentHandler: STPApplePayContextDelegate {
    func applePayContext(_ context: STPApplePayContext, didCreatePaymentMethod paymentMethod: STPPaymentMethod, paymentInformation: PKPayment, completion: @escaping STPIntentClientSecretCompletionBlock) {
        print("Payment creation")
        if let currentUser = self.currentUser {
            let data : [String : Any] = [
                "totalAmount": paymentSummaryItems[0].amount.floatValue,
                "stripeCustomerId": currentUser.stripeID
            ]
            self.functions.httpsCallable("createPaymentIntents").call(data) { (result, error) in
                if error != nil {
                    completion(nil, error)
                    return
                }
                guard let wrappedData = result?.data as? [String : Any] else {
                    completion(nil, nil)
                    return
                }
                
                guard let clientSecret = wrappedData["clientSecret"] as? String? else {
                    completion(nil, nil)
                    return
                }
                print(clientSecret ?? "No secret")
                completion(clientSecret, nil)
            }
        }
    }
    
    func applePayContext(_ context: STPApplePayContext, didCompleteWith status: STPPaymentStatus, error: Error?) {
        if let completionHandler = self.completionHandler {
            switch status {
            case .success:
                self.functions.httpsCallable("cleanCart").call(nil) { (result, error) in
                    if error != nil {
                        completionHandler(false)
                        return
                    }
                    completionHandler(true)
                }
                break
            case .error:
                print("Error")
                completionHandler(false)
                break
            case .userCancellation:
                print("Canceled")
                completionHandler(false)
                break
            @unknown default:
                fatalError()
            }
        }
        
    }
}
