//
//  Peck.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class Peck: Attack {
    
    //Returns a 1-10 score of whether or not this move should be used
    override func ShouldUse() -> Int { return 5 }
    
    //Return The Intended Target
    override func Target(Data : Battlefield) -> Int {
        
        var lowest : Int = 0
        var lowestVal : Int = Data.Heroes[0].CurHealth
        for i in 1...Data.Heroes.count {
            if Data.Heroes[i].CurHealth < lowestVal {
                lowest = i
                lowestVal = Data.Heroes[i].CurHealth
            }
        }
        return lowest
    }
}
