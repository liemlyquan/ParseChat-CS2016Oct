//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Liem Ly Quan on 10/26/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createNewMessage(){
        let message = PFObject(className: "Message_Swift_102016")
        message["text"] = messageTextField.text!
        message.saveInBackground(block: { (success, error) in
            if (success){
                print("success")
            } else {
                print(error?.localizedDescription)
            }
        })
    }

    @IBAction func onTapSendButton(_ sender: UIButton){
        createNewMessage()
    }
}
