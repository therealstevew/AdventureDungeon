//
//  Sword.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Default sword class
class Sword: Weapon {

    let stat = 3
    //ctor
    override init(){
        super.init()
        self.Name = "Sword"
        self.Characteristic = stat
        self.ItemType = "Weapon"
        self.rare = 0
    }
    //Define effects
    override func onEquip(User: Hero) {
        let hero = User
        
        hero.Attack += stat
    }
    override func onUnequip(User: Hero) {
        let hero = User
        
        hero.Attack -= stat
    }
}
