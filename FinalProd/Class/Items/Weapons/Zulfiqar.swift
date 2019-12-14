//
//  Zulfiqar.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Zulfiqar
class Zulfiqar: Weapon {

    let stat = 5
    //ctor
    override init(){
        super.init()
        self.Name = "Zulfiqar"
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
