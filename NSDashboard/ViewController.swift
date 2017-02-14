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

    var ref: FIRDatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

