//
//  Dou.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class Dou: Armor {

    let stat = 15
    
    override init(){
        super.init()
        self.Name = "Dou"
    }
    
    override func onEquip(User: Hero) {
        let hero = User
        
        hero.Defense += stat
    }
    override func onUnequip(User: Hero) {
        let hero = User
        
        hero.Defense -= stat
    }
}
