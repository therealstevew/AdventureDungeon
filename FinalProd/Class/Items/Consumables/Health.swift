//
//  Health.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

//Define Health Potion Object
class Health: Consumables {
    
    let stat = 10
    //set initial values
    override init(){
        super.init()
        self.Name = "Health Potion"
        self.Characteristic = stat
        self.ItemType = "Consumable"
    }
    //Define what happens on use
    override func onUse(User: Hero) {
        //define hero
        let hero = User
        
        //increase that heros health by stat
        hero.CurHealth += stat
        
        //if it pushes health above max, make health max
        if hero.CurHealth > hero.MaxHealth{
            hero.CurHealth = hero.MaxHealth
        }
    }

}
