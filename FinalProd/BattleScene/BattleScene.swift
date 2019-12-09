    //
    //  BattleScene.swift
    //  FinalProd
    //
    //  Created by Alex Teodorescu on 2019-12-08.
    //  Copyright © 2019 Steven Winstanley. All rights reserved.
    //
    // Combat system
    
    
    import SpriteKit
    import GameplayKit
    import UIKit

    class BattleScene: SKScene {
        
        // ViewController neccessary for segue out
        // AppDelegate for user data
        
        var ViewController : UIViewController?
        var AppDelegateRef : AppDelegate?
        
        // Holds the 2 teams locally
        
        var Heroes : [Hero]?
        var Enemies : [Enemy]?
        
        // Flag for combat being over
        
        var finished: Bool = false
        
        // Holds the sprites used by 2 teams
        
        var EnemyDisplay : [SKSpriteNode] = []
        var HeroDisplay : [SKSpriteNode] = []
        
        // Holds the battlefield locally, used by moves
        
        var dataBattlefield : Battlefield?
        
        // Prevents same dude attacking twice in a row unless they're alone
        
        var prevHero : Int = 0
        var prevEnemy : Int = 0
        
        // Keep track of whos turn it is
        
        var HeroTurn : Bool = false
        
        // Background graphic
        
        let floor : [SKSpriteNode] = [SKSpriteNode(imageNamed: "pngStone"), SKSpriteNode(imageNamed: "pngStone")]
        
        override func didMove(to view: SKView) {
            
            //Set up background
            floor[0].position = CGPoint(x: frame.width/2, y: frame.height/4)
            floor[1].position = CGPoint(x: frame.width/2, y: frame.height*3/4)
            floor[0].size = CGSize(width: frame.width, height: frame.height/2)
            floor[1].size = CGSize(width: frame.width, height: frame.height/2)
            addChild(floor[0])
            addChild(floor[1])
            
            // initialize battle data
            AppDelegateRef = UIApplication.shared.delegate as? AppDelegate
            dataBattlefield = AppDelegateRef?.currentBattlefield
            Heroes = AppDelegateRef?.currentBattlefield.Heroes
            Enemies = AppDelegateRef?.currentBattlefield.Enemies
            
            // decide how big and how to space enemies
            
            var EnemySpacing : Int = 0
            var EnemySize : Int = 0
            var Location : Int = 0
            
            switch Enemies!.count {
            case 1:
                EnemySpacing = Int(frame.size.width/4)
                EnemySize = Int(frame.size.width/2)
                break
            case 2:
                EnemySpacing = Int(frame.size.width/9)
                EnemySize = Int(frame.size.width/3)
                break
            case 3:
                EnemySpacing = Int(frame.size.width/16)
                EnemySize = Int(frame.size.width/4)
                break
            default:
                EnemySpacing = Int(frame.size.width/15)
                EnemySize = Int(frame.size.width/6)
            }
            Location = EnemySpacing
            for iEnemy in Enemies! {
                EnemyDisplay.append(SKSpriteNode(imageNamed: iEnemy.DisplayPic))
                addChild(EnemyDisplay.last!)
                EnemyDisplay.last!.position = CGPoint(x: CGFloat(Location+EnemySize/2), y: frame.size.height - CGFloat(EnemySpacing+EnemySize/2))
                EnemyDisplay.last!.size = CGSize(width: EnemySize, height: EnemySize)
                Location += EnemySpacing + EnemySize
                print(iEnemy.Name)
            }
            
            //decide how big and how to space heroes
            
            var HeroSpacing : Int = 0
            var HeroSize : Int = 0
            Location = 0
            
            switch Heroes!.count {
            case 1:
                HeroSpacing = Int(frame.size.width/4)
                HeroSize = Int(frame.size.width/2)
                break
            case 2:
                HeroSpacing = Int(frame.size.width/9)
                HeroSize = Int(frame.size.width/3)
                break
            case 3:
                HeroSpacing = Int(frame.size.width/16)
                HeroSize = Int(frame.size.width/4)
                break
            default:
                HeroSpacing = Int(frame.size.width/15)
                HeroSize = Int(frame.size.width/6)
            }
            Location = HeroSpacing
            for iHero in Heroes! {
                HeroDisplay.append(SKSpriteNode(imageNamed: iHero.DisplayPic))
                addChild(HeroDisplay.last!)
                HeroDisplay.last!.position = CGPoint(x: CGFloat(Location+HeroSize/2), y: CGFloat(HeroSpacing+HeroSize/2))
                HeroDisplay.last!.size = CGSize(width: HeroSize, height: HeroSize)
                Location += HeroSpacing + HeroSize
                print(iHero.Name)
            }
            
            // make a random one attack first, either heroes or enemies attack first randomly
            
            print("DONE INITIALIZING")
            prevHero = Int.random(in: 0..<Heroes!.count)
            prevEnemy = Int.random(in: 0..<Heroes!.count)
            HeroTurn = Bool.random()
            ProceedTurn()
        }
        
        override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
        }
        
        func ProceedTurn() {
            if(!finished){
           
                print("Starting Turn")
                var Attacker : Actor?
                
                //safety catch for if entire team dies at once
                if(Heroes!.count == 0){
                    finished = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoseScreen"), object: nil)
                }
                if(Enemies!.count == 0){
                    finished = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "WinScreen"), object: nil)
                }
                
                // define animation
                let moveUp = SKAction.move(by: CGVector(dx: 0, dy: 200), duration: TimeInterval(0.3))
                let moveDown = SKAction.move(by: CGVector(dx: 0, dy: -200), duration: TimeInterval(0.3))
                let nextTurn = SKAction.run {
                    self.ProceedTurn()
                }
                
                //determine who uses it
                if(HeroTurn != true){
                    if(Enemies!.count > 1){
                        var Rando = Int.random(in: 0..<Enemies!.count)
                        while Rando == prevEnemy {
                            Rando = Int.random(in: 0..<Enemies!.count)
                        }
                        prevEnemy = Rando
                    } else {
                        prevEnemy = 0
                    
                    }
                Attacker = Enemies![prevEnemy]
                EnemyDisplay[prevEnemy].run(SKAction.sequence([moveDown, moveUp, nextTurn]))
                } else {
                    if(Heroes!.count > 1){
                        var Rando = Int.random(in: 0..<Heroes!.count)
                        while Rando == prevHero {
                            Rando = Int.random(in: 0..<Heroes!.count)
                        }
                        prevHero = Rando
                    } else {
                        prevHero = 0
                    }
                    HeroDisplay[prevHero].run(SKAction.sequence([moveUp, moveDown, nextTurn]))
                    Attacker = Heroes![prevHero]
                }
                // give opposite team the turn
                HeroTurn = !HeroTurn
                //use the actual move
                print("Determine move to use.")
                var moveToUse = 0;
                var priority = 0;
                for moveNumber in 0..<Attacker!.Abilities.count {
                    print("Testing move \(moveNumber)")
                    let testPrio = Attacker!.Abilities[moveNumber].ShouldUse(User: Attacker!, Data: dataBattlefield!)
                    if(testPrio > priority) {
                        print("It's the best.")
                        priority = testPrio
                        moveToUse = moveNumber
                    }
                }

                Attacker!.Abilities[moveToUse].OnUse(User: Attacker!, Data: dataBattlefield!)
                print("Used move.")
                // see if anyone died / if game is over
                var OneDied = false
                var heroesAlive = false
                var enemiesAlive = false
            
                print("Checking for deaths now.")
                print(Heroes!.count)
                var dude = 0
        
                //remove from team if they dead
                while dude < Heroes!.count {
                    print("Hero being checked is number \(dude)")
                    print("His health is \(Heroes![dude].CurHealth)")
                    if(Heroes![dude].CurHealth <= 0){
                        Heroes!.remove(at: dude)
                        dataBattlefield!.Heroes.remove(at: dude)
                        OneDied = true
                        print(HeroDisplay.count)
                        HeroDisplay[dude].alpha = CGFloat(0.2)
                        HeroDisplay.remove(at: dude)
                        dude -= 1
                        print("Removed a guy, heroes is now \(Heroes!)")
                        print("dude is now \(dude)")
                    } else {
                        heroesAlive = true
                    }
                    dude += 1
                }
                dude = 0
                print("There are \(Enemies!.count) enemies")
                while dude < Enemies!.count {
                    print("Enemy being checked is number \(dude)")
                    print("his health is \(Enemies![dude].CurHealth)")
                    if(Enemies![dude].CurHealth <= 0){
                        Enemies?.remove(at: dude)
                        dataBattlefield!.Enemies.remove(at: dude)
                        OneDied = true
                        EnemyDisplay[dude].alpha = CGFloat(0)
                        EnemyDisplay.remove(at: dude)
                        dude -= 1
                        print("Removed a guy, enemies is now \(Enemies!)")
                        print("dude is now \(dude)")
                    } else {
                        enemiesAlive = true
                    }
                    dude += 1
                }
                
                //end battle if one team is dead
                if(enemiesAlive != true){
                    finished = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "WinScreen"), object: nil)
                } else if(heroesAlive != true) {
                    finished = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoseScreen"), object: nil)
                }
            }
        }

    }
