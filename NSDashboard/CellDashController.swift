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
    @IBOutlet weak var peak: UILabel!
   
    
    @IBOutlet weak var twitter: UILabel!
    
    @IBOutlet weak var facebook: UILabel!
    @IBOutlet weak var instagram: UILabel!
    
    @IBOutlet weak var linkedin: UILabel!
    @IBOutlet weak var totalUsuarios: UILabel!

    @IBOutlet weak var graphic: GraphicComponent!

    @IBOutlet weak var activeUsers: CircleComponent!
    
    @IBOutlet weak var anonymousUsers: CircleComponent!

    @IBOutlet weak var firstGraphic: HorizontalComponent!
    @IBAction func actio(_ sender: Any) {
    
        let time = [1,1,1,2,2,2,2,2,3,3,3,4].map{ Double($0)}
        let pag = [true,false,true,true,true,false,true,true,true,true,false,false]
        for i in 0...11{
        
        let tree = ref.child("stream").child("1")
        
        tree.child("comeco_transmissao").setValue( Double(Date().timeIntervalSince1970))
        tree.child("twitter").setValue( 5200)
        tree.child("facebook").setValue( 100)
        tree.child("linkedin").setValue( 500)
        tree.child("instagram").setValue( 500)
        
        let key = tree.child("usuarios").childByAutoId().key
        
        let users : Any? = [ "entrada"  : Double(Date().timeIntervalSince1970),
                             "na_pagina" : pag[i],
                              "saida":  Double(Date().addingTimeInterval(TimeInterval( time[i] * -60.0)).timeIntervalSince1970)
                           ]
        
        
        
        let update = ["stream/\(tree.key)/x : users]
            
        
        
        ref.updateChildValues(update)
        }
            
            
    }

    @IBAction func ativos(_ sender: Any) {
    
        
        
        
        
        let tree = ref.child("stream").child("1")
        
        tree.child("comeco_transmissao").setValue( Double(Date().timeIntervalSince1970))
        tree.child("twitter").setValue( 5200)
        tree.child("facebook").setValue( 100)
        tree.child("linkedin").setValue( 500)
        tree.child("instagram").setValue( 500)
        
        let key = tree.child("usuarios").childByAutoId().key
        
        let users : Any? = [ "entrada"  : Double(Date().timeIntervalSince1970),
                             "na_pagina" : false,
        ]
        
        
        
        let update = ["stream/\(tree.key)/users/\(key)/" : users]
        
        
        ref.updateChildValues(update)
        
    
    }
    @IBOutlet weak var secondGraphic: HorizontalComponent!
    
}
