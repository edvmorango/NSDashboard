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
    
    var peak : Int = 0
    @IBOutlet var table: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.separatorColor = UIColor.clear
      
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "circle")! as! CellDashController
        
        let refHandle = ref.observe(FIRDataEventType.value, with: { (snapshot) in
            
            guard let value = snapshot.value as? NSDictionary else{return}
            guard let streamParent =  value["stream"]  as? NSArray else{return}
            guard let stream = streamParent[1] as? NSDictionary  else{return}
           
            guard let usersRaw = stream["users"] as? NSDictionary else{return}

            
            
            let users = usersRaw.map{ x in x.value as! NSDictionary}
//            let users = usersLayer.map{x in x[")"] as! [String: AnyObject]}
//
//            
//            
            let streamBegin = stream["comeco_transmissao"] as! Double
            let totalTwitter  = stream["twitter"] as! Int
            let totalFacebook = stream["facebook"] as! Int
            let totalInstagram  = stream["instagram"] as! Int
            let totalLinkedin  = stream["linkedin"] as! Int
            
            
            let totalUsers = Double(users.count)
            let activeUsers = users.map{($0["entrada"] as! Double,$0["na_pagina"] as! Bool,$0["saida"] as? Double) }.filter{ $2 == nil }
           
            
            let totalActiveUsers = Double(activeUsers.count)
            let totalEngagedUsers =  Double(activeUsers.filter{ _,x,_ in x  }.count)
            
            if activeUsers.count > self.peak {
                self.peak = activeUsers.count
            }
            
        
            cell.totalUsuarios.text = "\(Int(totalUsers))"
            cell.activeUsers.perc =   CGFloat(totalActiveUsers / totalUsers * 100)
            cell.anonymousUsers.perc = CGFloat( totalEngagedUsers/totalActiveUsers * 100)
            
            cell.twitter.text = "\(totalTwitter)"
            cell.facebook.text = "\(totalFacebook)"
            cell.instagram.text = "\(totalInstagram)"
            cell.linkedin.text = "\(totalLinkedin)"
            cell.peak.text = "\(self.peak)"
        })
            
        return  cell
    
    }


    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

}


