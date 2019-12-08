//
//  Enemy.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import Foundation

class Enemy : Actor {
    
    var Abilities: [Attack] = []
    var DisplayPic: String = ""
    var Status : [String] = []
    var Name : String = ""
    var MaxHealth : Int = 0
    var CurHealth : Int = 0
    var Defense : Int = 0
    var Attack : Int = 0
    
    init(Data : EnemyData) {
        self.Name = Data.Name;
        self.MaxHealth = Data.MaxHealth;
        self.CurHealth = Data.MaxHealth;
        self.DisplayPic = Data.DisplayPic;
        self.Defense = Data.Defense;
        self.Attack = Data.Attack;
        self.Abilities = Data.Abilities;
    }

}
