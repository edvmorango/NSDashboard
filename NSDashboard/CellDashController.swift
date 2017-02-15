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


    @IBOutlet weak var activeUsers: CircleComponent!
    
    @IBOutlet weak var anonymousUsers: CircleComponent!

    @IBOutlet weak var firstGraphic: HorizontalComponent!

    @IBOutlet weak var secondGraphic: HorizontalComponent!
    
    @IBOutlet weak var thirdGraphic: HorizontalComponent!
    
    @IBOutlet weak var forthGraphic: HorizontalComponent!
    
}
