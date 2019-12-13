//
//  Dou.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

//Define Item class Armor
class Dou: Armor {

    let stat = 2
    //set initial values
    override init(){
        super.init()
        self.Name = "Dou"
        self.Characteristic = stat
        self.ItemType = "Armour"
        self.rare = 7
    }
    //Define effects
    override func onEquip(User: Hero) {
        let hero = User
        
        hero.Defense += stat
    }
    override func onUnequip(User: Hero) {
        let hero = User
        
        hero.Defense -= stat
    }
}
