//
//  EnemyData.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import Foundation

class EnemyData {
    
    var Name : String;
    var MaxHealth : Int;
    var DisplayPic : String;
    
    init(Name : String, MaxHealth : Int, DisplayPic : String) {
        self.Name = Name;
        self.MaxHealth = MaxHealth;
        self.DisplayPic = DisplayPic;
    }
}
