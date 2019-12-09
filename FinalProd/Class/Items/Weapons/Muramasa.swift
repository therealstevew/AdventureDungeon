//
//  Muramasa.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class Muramasa: Weapon {

    let stat = 100
    var maxHealth = 0
    
    override init(){
        super.init()
        self.Name = "Muramasa"
        self.Characteristic = stat
        self.ItemType = "Weapon"
    }
    
    override func onEquip(User: Hero) {
        let hero = User
        
        hero.Attack += stat
        maxHealth = hero.MaxHealth - 1
        hero.MaxHealth = 1
    }
    override func onUnequip(User: Hero) {
        let hero = User
        
        hero.Attack -= stat
        hero.MaxHealth += maxHealth
    }
}
