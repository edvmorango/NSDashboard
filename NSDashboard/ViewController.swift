//
//  ViewController.swift
//  NSDashboard
//
//  Created by José Eduardo Vieira Morango on 13/02/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tree = ref.child("stream")
        tree.childByAutoId()
        tree.child("begin").setValue( Double(Date().timeIntervalSince1970))
        
//        tree.child("users").setValue([    ["id" : 1, "anonymous": true, "begin" :  Double(Date().timeIntervalSince1970) ]])
        
        let key = tree.child("users").childByAutoId().key
        let val : Any? = ["id" : 6, "anonymous": true, "begin" :  Double(Date().timeIntervalSince1970) ]
        
        
        let update = ["/users/\(key)/)" : val ]
        
        ref.updateChildValues(update)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

