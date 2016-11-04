//
//  ViewController.swift
//  Firebase1
//
//  Created by aditya on 11/4/16.
//  Copyright © 2016 aditya. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func LoginFacebookTaped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler: {(result, error) in
            if error != nil{
                print("Dodol, unable to auth with facebook \(error)")
            } else if result?.isCancelled == true{
                print("Dodol: cancel auth with facebook")
            } else {
                print("Dodol: auth with facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        })
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("Dodol: unable to auth with firebase \(error)")
            } else {
                print("Dodol: auth with firebase")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

