//
//  BattleScreenViewController.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class BattleScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(WinScreen), name: NSNotification.Name(rawValue: "WinScreen"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoseScreen), name: NSNotification.Name(rawValue: "LoseScreen"), object: nil)
        
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "BattleScene") {
            
                let AppDelegateRef : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                let battleData = Battlefield()
                
                battleData.Heroes = AppDelegateRef.UserData.Party!
                let numEnemies = Int.random(in: 2...4)
                for number in 0..<numEnemies {
                    battleData.Enemies.append(DataStore.getEnemy(Which: Int.random(in: 0...7)))
                }
                for numHeroes in 0..<4 {
                    print("Adding hero")
                    print(numHeroes)
                    battleData.Heroes.append(DataStore.getHero(Which: Int.random(in: 0...7)))
                }
                AppDelegateRef.currentBattlefield = battleData

                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func WinScreen() {
        self.performSegue(withIdentifier: "WinScreen", sender: nil)
    }
    
    @objc func LoseScreen() {
        self.performSegue(withIdentifier: "LoseScreen", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
