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

        
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "BattleScreen") {
             
                let AppDelegateRef : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                let battleData = Battlefield()
                
                battleData.Heroes = AppDelegateRef.UserData.Party
                let numEnemies = Int.random(in: 2...4)
                for number in 0...numEnemies {
                    battleData.Enemies.append(DataStore.getEnemy(Which: Int.random(in: 0...7)))
                }
                AppDelegateRef.currentBattlefield = battleData
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
                
            }
        }
        
        // Do any additional setup after loading the view.
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
