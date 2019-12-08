//
//  BattleScene.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//
import SpriteKit
import GameplayKit
import UIKit

class BattleScene: SKScene {
    
    var ViewController : UIViewController?
    var AppDelegateRef : AppDelegate?
    
    public var Heroes : [Hero]?
    public var Enemies : [Enemy]?
    
    public var EnemyDisplay : [SKSpriteNode]?
    public var HeroDisplay : [SKSpriteNode]?
    
    override func didMove(to view: SKView) {
        
        AppDelegateRef = UIApplication.shared.delegate as? AppDelegate
        
        Heroes = AppDelegateRef?.currentBattlefield.Heroes
        Enemies = AppDelegateRef?.currentBattlefield.Enemies
        
        var EnemySpacing : Int = 50
        var EnemySize : Int = 125
        var Location : Int = EnemySpacing
        
        switch Enemies!.count {
        case 1:
            EnemySpacing = 275
            EnemySize = 200
            break
        case 2:
            EnemySpacing = 150
            EnemySize = 150
            break
        case 3:
            EnemySpacing = 94
            break
        default:
            EnemySpacing = 50
        }
        for iEnemy in Enemies! {
            
        }
        
    }

}
