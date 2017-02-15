//
//  ViewController.swift
//  NSDashboard
//
//  Created by José Eduardo Vieira Morango on 13/02/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import FirebaseDatabase
class MainViewController: UITableViewController {
    
   
    @IBOutlet var table: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        table.separatorColor = UIColor.clear
        
        
        let tree = ref.child("stream")
        tree.childByAutoId()
        tree.child("begin").setValue( Double(Date().timeIntervalSince1970))
        
        
        let key = tree.child("users").childByAutoId().key
        let val : Any? = ["id" : 7, "anonymous": true, "begin" :  Double(Date().timeIntervalSince1970), "end" : Double(Date().timeIntervalSince1970) ]
        
        
        let update = ["/users/\(key)/)" : val ]
        
        ref.updateChildValues(update)
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return  tableView.dequeueReusableCell(withIdentifier: "circle")! as UITableViewCell
    }


    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

}


