//
//  Harpe.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Harpe Weapon
class Harpe: Weapon {

    let stat = 4
    //ctor
    override init(){
        super.init()
        self.Name = "Harpe"
        self.Characteristic = stat
        self.ItemType = "Weapon"
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
