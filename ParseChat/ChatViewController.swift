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

    var objectChat: [PFObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initChatData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createNewMessage(){
        let message = PFObject(className: "Message_Swift_102016")
        message["user"] = PFUser.current()
        message["text"] = messageTextField.text!
        message.saveInBackground(block: { (success, error) in
            if (success){
                self.objectChat.append(message)
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        })
    }

    @IBAction func onLogout(_ sender: AnyObject) {
        PFUser.logOut()
        if(PFUser.current() == nil){
            self.performSegue(withIdentifier: "logoutSegue", sender: self)
        }
    }
    
    func onTimer(){
        initChatData()
    }
    
    func initChatData(){
        let query = PFQuery(className: "Message_Swift_102016")
        query.includeKey("user")
        query.findObjectsInBackground { (objects, error) in
            if error == nil{
                self.objectChat = objects!
                self.tableView.reloadData()
            }
            else{
                print(error?.localizedDescription)
            }
           
        }
    }
    
    @IBAction func onTapSendButton(_ sender: UIButton){
        createNewMessage()
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageCell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageTableViewCell
        
        messageCell.messageLable.text = objectChat[indexPath.row]["text"] as? String
        if let user = objectChat[indexPath.row]["user"] as? PFUser {
            messageCell.userLable.text = user.username
        } else {
            messageCell.userLable.text = "Anonymous"
        }
        
        return messageCell
    }
}
