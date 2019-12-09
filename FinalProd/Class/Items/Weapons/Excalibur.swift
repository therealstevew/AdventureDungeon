//
//  Excalibur.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Weapon Excalibur
class Excalibur: Weapon {

    let stat = 10
    //ctor
    override init(){
        super.init()
        self.Name = "Excalibur"
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
