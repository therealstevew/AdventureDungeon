//
//  AttackSteal.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class AttackSteal: AttackLowest {

    override func OnUse(User: Actor, Data: Battlefield) {
        super.OnUse(User: User, Data: Data)
        var lowest : Actor = Hero()
        var lowestValue : Int = 999
        if(User is Enemy){
            for Dude in Data.Enemies {
                if Dude.CurHealth < lowestValue {
                    lowest = Dude
                    lowestValue = Dude.CurHealth
                }
            }
        } else {
            for Dude in Data.Heroes {
                if Dude.CurHealth < lowestValue {
                    lowest = Dude
                    lowestValue = Dude.CurHealth
                }
            }
        }
        lowest.CurHealth += User.Attack/2
    }
    
}
