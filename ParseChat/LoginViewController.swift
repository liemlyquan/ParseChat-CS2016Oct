//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Pj Nguyen on 10/26/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(_ sender: AnyObject) {
        PFUser.logInWithUsername(inBackground: txtUsername.text!, password: txtPassword.text!, block: { (user, error) in
            if((user) != nil){
                print("scuess")
            }
            else{
                print("fail")
            }
        })
    }
    
    @IBAction func onSignUp(_ sender: AnyObject) {
        let user = PFUser()
        user.username = txtUsername.text
        user.password = txtPassword.text
        user.email = txtUsername.text! + "@email.com"
        
        
        // user.signUpInBackground(block: succeeded: Bool, error: NSError?) -> Void in
        
        
        user.signUpInBackground( block: {
            (succeeded, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
                // Show the errorString somewhere and let the user try again.
            } else {
                print("success")
                // Hooray! Let them use the app now.
            }
            
        })
    }
}
