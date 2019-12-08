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
        //User.CurHealth = User.CurHealth + User.Attack/2
        if(User.CurHealth > User.MaxHealth){
            //User.CurHealth = User.MaxHealth
        }
    }
    
}
