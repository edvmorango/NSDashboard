//
//  CellDashController.swift
//  NSDashboard
//
//  Created by José Eduardo Vieira Morango on 15/02/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import UIKit


class CellDashController : UITableViewCell{
    @IBOutlet weak var totalUsuarios: UILabel!


    @IBOutlet weak var activeUsers: CircleComponent!
    
    @IBOutlet weak var anonymousUsers: CircleComponent!

    @IBOutlet weak var firstGraphic: HorizontalComponent!
    @IBAction func actio(_ sender: Any) {
    
        
        let tree = ref.child("stream")
        tree.childByAutoId()
        tree.child("begin").setValue( Double(Date().timeIntervalSince1970))
        let key = tree.child("users").childByAutoId().key
        let val : Any? = ["id" : 7, "anonymous": false, "begin" :  Double(Date().timeIntervalSince1970),  "end" : Double(Date().timeIntervalSince1970),
                          "viewing": false, "tweets" : 1
        ]
        let update = ["stream/users/\(key)/)" : val ]
        
        
        
        ref.updateChildValues(update)
    
    }

    @IBOutlet weak var secondGraphic: HorizontalComponent!
    
}
