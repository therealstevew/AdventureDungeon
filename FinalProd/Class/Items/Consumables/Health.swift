//
//  Health.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class Health: Consumables {

    let stat = 10
    
    override init(){
        super.init()
        self.Name = "Health Potion"
        self.Characteristic = stat
        self.ItemType = "Consumable"
    }
    override func onUse(User: Hero) {
        let hero = User
        
        hero.CurHealth += stat
        
        if hero.CurHealth > hero.MaxHealth{
            hero.CurHealth = hero.MaxHealth
        }
    }

}
