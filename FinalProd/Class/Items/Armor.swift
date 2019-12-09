//
//  Armor.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

///Parent Class for Armor type objects
class Armor: Item {
    //define effects on adding armor
    func onEquip(User: Hero ) -> Void { }
    //define effects on removing armor
    func onUnequip(User: Hero ) -> Void { }
}
