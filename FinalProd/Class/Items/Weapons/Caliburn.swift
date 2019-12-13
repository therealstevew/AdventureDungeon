//
//  Caliburn.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Caliburn Weapon class
class Caliburn: Weapon {

    let stat = 6
    //ctor
    override init(){
        super.init()
        self.Name = "Caliburn"
        self.Characteristic = stat
        self.ItemType = "Weapon"
        self.rare = 7
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
