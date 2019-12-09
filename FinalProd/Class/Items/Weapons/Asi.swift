//
//  Asi.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Asi Weapon
class Asi: Weapon {

    let stat = 7
    //ctor
    override init(){
        super.init()
        self.Name = "Asi"
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
