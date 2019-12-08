//
//  DataStore.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class DataStore {
    static func getHero(Which: Int) -> Hero {
        var dab : Hero = Hero()
        return dab;
    }
    
    static func getEnemy(Which : Int) -> Enemy {
        let enemyData : EnemyData = EnemyData()
        switch Which{
        case 0: //Beak Thing
            enemyData.Name = "Beak Thing"
            enemyData.DisplayPic = "BeakThing.png"
            enemyData.MaxHealth = 25
            enemyData.Attack = 12
            enemyData.Defense = 0
            enemyData.Abilities = [Peck()]
            break
        case 1: // Clown
            enemyData.Name = "Clown Boy"
            enemyData.DisplayPic = "Clown.png"
            enemyData.MaxHealth = 10
            enemyData.Attack = 5
            enemyData.Defense = 2
            enemyData.Abilities = []
        default: //Code Broke
            enemyData.Name = "Glitch Boy"
            enemyData.DisplayPic = "Front1"
            enemyData.MaxHealth = 999
        }
        return Enemy(Data: enemyData)
    }
}
