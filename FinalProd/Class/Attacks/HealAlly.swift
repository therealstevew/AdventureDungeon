//
//  HealAlly.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class HealAlly: Attack {

    override func ShouldUse(User: Actor, Data : Battlefield) -> Int {
        if(User is Enemy){
            for Guy in Data.Enemies {
                if Guy.CurHealth < Guy.MaxHealth / 2 {
                    return 9
                }
            }
        } else {
            for Guy in Data.Heroes {
                if Guy.CurHealth < Guy.MaxHealth / 2 {
                    return 9
                }
            }
        }
        return 3
    }
    
    override func Target(User: Actor, Data:Battlefield) -> Int {
        var lowest : Int = 0
        var lowestVal : Int = 0
        if(User is Hero){
            lowestVal = Data.Heroes[0].CurHealth
            for i in 1..<Data.Heroes.count {
                if Data.Heroes[i].CurHealth < lowestVal {
                    lowest = i
                    lowestVal = Data.Heroes[i].CurHealth
                }
            }
        } else {
            for i in 1..<Data.Enemies.count {
                if Data.Enemies[i].CurHealth < lowestVal {
                    lowest = i
                    lowestVal = Data.Enemies[i].CurHealth
                }
            }
        }
        return lowest
    }
    
    override func OnUse(User: Actor, Data: Battlefield) {
        var myTarget : Actor
        if(User is Hero){
            myTarget = Data.Heroes[Target(User:User, Data:Data)]
        } else {
            myTarget = Data.Enemies[Target(User:User, Data:Data)]
        }
        myTarget.CurHealth += User.Attack
        if(myTarget.CurHealth > myTarget.MaxHealth) {
            myTarget.CurHealth = myTarget.MaxHealth
        }
    }
}
