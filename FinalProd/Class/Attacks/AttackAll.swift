//
//  AttackAll.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class AttackAll: Attack {
    override func ShouldUse(User: Actor, Data: Battlefield) -> Int {
        if(User is Hero){
            return Data.Enemies.count * 2
        } else {
            return Data.Heroes.count * 2
        }
    }
    
    override func OnUse(User: Actor, Data: Battlefield) {
        if(User is Hero){
            for Guy in Data.Enemies {
                if(Guy.Defense < User.Attack/2){
                    Guy.CurHealth -= User.Attack/2
                }
            }
        } else {
            for Guy in Data.Heroes {
                if(Guy.Defense < User.Attack/2){
                    Guy.CurHealth -= User.Attack/2
                }
            }
        }
    }
}
