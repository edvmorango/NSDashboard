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
        
      
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "circle")! as! CellDashController
        
        let refHandle = ref.observe(FIRDataEventType.value, with: { (snapshot) in
            
            
            
            guard  let value = snapshot.value as? NSDictionary else{
            return 
            }
            let stream =  value["stream"]  as? NSDictionary
            guard let usersRaw = stream?["users"] as? NSDictionary else{
                return
            }

            let usersLayer = usersRaw.map{ x in x.value as! NSDictionary}
            let users = usersLayer.map{x in x[")"] as! [String: AnyObject]}
            
            
            
            let totalTweets = users.map{x in x["tweets"] as! Int}.reduce(0, +)
            let totalAnonymous = users.map{x in x["anonymous"] as! Bool}.filter{$0}.count
            let totalActive = users.map{x in (x["begin"] as! Double,x["end"] as? Double)}.filter{(x,y) in y != nil}.count
            let totalWatching = users.map{x in x["viewing"] as! Bool}.filter{$0}.count
            let totalUsers = users.count
          
            
            cell.totalUsuarios.text = "\(totalUsers)"
            
            
            
            
            let dTotalActive = Double(totalActive)
            let dTotalUsers = Double(totalUsers)
            
            
            cell.activeUsers.perc = CGFloat( (dTotalActive / dTotalUsers * 100))
            cell.firstGraphic.perc = CGFloat(totalWatching/totalUsers * 100)
            cell.secondGraphic.perc = CGFloat(totalTweets/totalUsers)
            
            
        
        })
            
        return  cell
    
    }


    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

}


