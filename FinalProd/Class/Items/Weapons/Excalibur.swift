//
//  Excalibur.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class Excalibur: Weapon {

    override init(){
        super.init()
        self.Name = "Excalibur"
    }
    
    override func onEquip(User: Hero) {
        var dave = User
        
        dave.Attack += 30
    }
    override func onUnequip(User: Hero) {
        var dave = User
        
        dave.Attack -= 30
    }
}
