//
//  ViewController.swift
//  TouchID-Swift
//
//  Created by vamsi krishna reddy kamjula on 8/3/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    var error:NSError?
    
    @IBAction func TouchIDButton(_ sender: UIButton) {
        let touchIDContext = LAContext()
        guard touchIDContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            print("No Touch Option")
            return
        }
        
        touchIDContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Testing"){
            success, error in
            if (success) {
                print("Happy")
            } else {
                self.showCustomErrorMessage(error: error as! LAError)
            }
        }
        
    }
    
    func showCustomErrorMessage(error: LAError) {
        switch error {
        case LAError.authenticationFailed:
            print("Authentication Failed")
        default:
            print("Success")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

