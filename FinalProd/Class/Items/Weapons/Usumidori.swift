//
//  Usumidori.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Usumidori Weapon
class Usumidori: Weapon {

    let stat = 4
    //ctor
    override init(){
        super.init()
        self.Name = "Usumidori"
        self.Characteristic = stat
        self.ItemType = "Weapon"
        self.rare = 8
    }
    //Define Effects
    override func onEquip(User: Hero) {
        let hero = User
        
        hero.Attack += stat
    }
    override func onUnequip(User: Hero) {
        let hero = User
        
        hero.Attack -= stat
    }
}
