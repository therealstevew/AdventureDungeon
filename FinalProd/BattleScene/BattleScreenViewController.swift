//
//  BattleScreenViewController.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//
// Runs the sprite kit battle.

import UIKit
import SpriteKit
import GameplayKit

class BattleScreenViewController: UIViewController {
    let AppDelegateRef : AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        //Enables game to exit
        
        NotificationCenter.default.addObserver(self, selector: #selector(WinScreen), name: NSNotification.Name(rawValue: "WinScreen"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoseScreen), name: NSNotification.Name(rawValue: "LoseScreen"), object: nil)
        
        //Fires up game view with an instance of battlefield to hold all the data
        
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "BattleScene") {
            
                let battleData = Battlefield()
                
                
                let numEnemies = Int.random(in: 2...4)
                for number in 0..<numEnemies {
                    battleData.Enemies.append(DataStore.getEnemy(Which: Int.random(in: 0...7)))
                }
                let tempParty = AppDelegateRef.UserData.Party!
               
                    battleData.Heroes = tempParty
                
                AppDelegateRef.currentBattlefield = battleData

                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
        }
    }
    
    // functions used to exit game
    
    //give random items when win
    @objc func WinScreen() {
        var itemsGot : Array<Item> = []
        var rand = Int.random(in: 1 ..< 3)
        for n in 0...rand{
            var itemSelect = Int.random(in: 0 ..< 13)
            itemsGot.append(DataStore.getitem(Which: itemSelect))
            AppDelegateRef.UserData.Items!.append(DataStore.getitem(Which: itemSelect))
        }
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
