//
//  Enemy.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import Foundation

class Enemy : Actor {
    
    
    var DisplayPic: String
    var Status : [String] = [];
    var Name : String;
    var MaxHealth : Int;
    var CurHealth : Int;
    
    init(Data : EnemyData) {
        self.Name = Data.Name;
        self.MaxHealth = Data.MaxHealth;
        self.CurHealth = Data.MaxHealth;
        self.Display = Data.Display;
    }

}
