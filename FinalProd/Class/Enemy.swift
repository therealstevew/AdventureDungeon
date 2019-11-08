//
//  Enemy.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import Foundation

class Enemy {
    
    public var Status : [String] = [];
    public var Name : String;
    public var MaxHealth : Int;
    public var CurHealth : Int;
    public var Display : String;
    
    init(Data : EnemyData) {
        self.Name = Data.Name;
        self.MaxHealth = Data.MaxHealth;
        self.CurHealth = Data.MaxHealth;
        self.Display = Data.Display;
    }

}
