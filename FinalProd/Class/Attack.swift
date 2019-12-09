//
//  EnemyAttack.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import Foundation

class Attack : NSObject {
    
    //Returns a 1-10 score of whether or not this move should be used
    func ShouldUse(User: Actor, Data : Battlefield) -> Int {return 0}
    
    //Return The Intended Target
    func Target(User: Actor, Data : Battlefield) -> Int {return 0}
    
    //What the move does
    func OnUse(User : Actor, Data : Battlefield) -> Void {
        var TargetUnit : Actor
        if(User is Enemy){
            TargetUnit = Data.Heroes[Target(User:User, Data:Data)]
        } else {
            TargetUnit = Data.Enemies[Target(User:User, Data:Data)]
        }
        if(TargetUnit.Defense < User.Attack){
            TargetUnit.CurHealth -= User.Attack - TargetUnit.Defense
        }
    }
}
