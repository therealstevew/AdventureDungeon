//
//  Bolster.swift
//  FinalProd
//
//  Created by Christopher Reynolds on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class Bolster: Attack {
    override func ShouldUse(User: Actor, Data: Battlefield) -> Int {
        if(User is Hero){
            return Data.Heroes.count * 2
        } else {
            return Data.Enemies.count * 2
        }
    }
    
    override func OnUse(User: Actor, Data: Battlefield) {
        if(User is Hero){
            for Guy in Data.Heroes {
                Guy.CurHealth += User.Defense
            }
        } else {
            for Guy in Data.Enemies {
                    Guy.CurHealth += User.Defense
                }
            }
        }
    
}

