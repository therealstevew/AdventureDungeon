//
//  Durandal.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Durandal Weapon Class
class Durandal: Weapon {

    let stat = 9
    //ctor
    override init(){
        super.init()
        self.Name = "Durandal"
        self.Characteristic = stat
        self.ItemType = "Weapon"
        self.rare = 4
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
