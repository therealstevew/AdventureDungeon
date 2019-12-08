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
            enemyData.Attack = 20
            enemyData.Defense = 0
            enemyData.Abilities = [AttackLowest()]
            break
        case 1: // Clown
            enemyData.Name = "Clown Boy"
            enemyData.DisplayPic = "Clown.png"
            enemyData.MaxHealth = 10
            enemyData.Attack = 5
            enemyData.Defense = 2
            enemyData.Abilities = [AttackLowest(),HealAlly()]
            break
        case 2: // Furry
            enemyData.Name = "Angry Furry"
            enemyData.DisplayPic = "Furry.png"
            enemyData.MaxHealth = 30
            enemyData.Attack = 12
            enemyData.Defense = 0
            enemyData.Abilities = [AttackLowest(), AttackAll()]
            break
        case 3: // Ghost
            enemyData.Name = "Spooky Scary Ghost"
            enemyData.DisplayPic = "Ghost.png"
            enemyData.MaxHealth = 50
            enemyData.Attack = 3
            enemyData.Defense = 10
            enemyData.Abilities = [AttackLowest()]
            break
        case 4: // Ninja
            enemyData.Name = "Weeahboo"
            enemyData.DisplayPic = "Ninja.png"
            enemyData.MaxHealth = 10
            enemyData.Attack = 15
            enemyData.Defense = 8
            enemyData.Abilities = [AttackLowest()]
            break
        case 5: // Samurai
            enemyData.Name = "Tom Cruise"
            enemyData.DisplayPic = "Samurai.png"
            enemyData.MaxHealth = 15
            enemyData.Attack = 10
            enemyData.Defense = 5
            enemyData.Abilities = [AttackLowest()]
        case 6: // Skele
            enemyData.Name = "Flying Boner"
            enemyData.DisplayPic = "Skele.png"
            enemyData.MaxHealth = 10
            enemyData.Attack = 10
            enemyData.Defense = 0
            enemyData.Abilities = [AttackAll(),HealAlly()]
        case 7: // Vamp
            enemyData.Name = "Vampire"
            enemyData.DisplayPic = "Vamp.png"
            enemyData.MaxHealth = 15
            enemyData.Attack = 10
            enemyData.Defense = 0
            enemyData.Abilities = [AttackSteal()]
        default: //Code Broke
            enemyData.Name = "Glitch Boy"
            enemyData.DisplayPic = "Front1"
            enemyData.MaxHealth = 999
            enemyData.Attack = 999
            enemyData.Defense = 999
            enemyData.Abilities = [AttackAll()]
        }
        return Enemy(Data: enemyData)
    }
}
