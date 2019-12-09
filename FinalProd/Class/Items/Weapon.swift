//
//  Weapon.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//Define Base weapon class
class Weapon: Item {
    //Define on Equip to a party member
    func onEquip(User: Hero) -> Void {}
    //Define on Unequip from a party member
    func onUnequip(User: Hero) -> Void {}
}
