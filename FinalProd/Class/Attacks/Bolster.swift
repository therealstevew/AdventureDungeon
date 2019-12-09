//
//  Bolster.swift
//  FinalProd
//
//  Created by Christopher Reynolds on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Bolster Ability
// Heals everyone same as attackall but for allies
class Bolster: Attack {
    //Should be used
    override func ShouldUse(User: Actor, Data: Battlefield) -> Int {
        if(User is Hero){
            return Data.Heroes.count * 2
        } else {
            return Data.Enemies.count * 2
        }
    }
    //Define Use effects
    override func OnUse(User: Actor, Data: Battlefield) {
        if(User is Hero){
            for Guy in Data.Heroes {
                Guy.CurHealth += User.Defense
                if Guy.CurHealth > Guy.MaxHealth{
                    Guy.CurHealth = Guy.MaxHealth
                }
            }
        } else {
            for Guy in Data.Enemies {
                    Guy.CurHealth += User.Defense
                }
            }
        }
    
}

