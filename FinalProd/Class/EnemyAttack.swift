//
//  EnemyAttack.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import Foundation

protocol EnemyAttack {
    
    //Returns a 1-10 score of whether or not this move should be used
    func ShouldUse() -> Int
    
    //Return The Intended Target
    func Target() -> Actor
    
    //What the move does
    func OnUse(Target : Actor, User : Actor)
}
