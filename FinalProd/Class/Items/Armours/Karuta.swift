//
//  Karuta.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//define for Karuta armor
class Karuta: Armor {

    let stat = 1
    //set initial values
    override init(){
        super.init()
        self.Name = "Karuta"
        self.Characteristic = stat
        self.ItemType = "Armour"
        self.rare = 9
    }
    //effects
    override func onEquip(User: Hero) {
        let hero = User
        
        hero.Defense += stat
    }
    override func onUnequip(User: Hero) {
        let hero = User
        
        hero.Defense -= stat
    }
}
