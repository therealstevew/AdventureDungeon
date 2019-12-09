//
//  Hero.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
//like actor but extra stuff like equip and id for database storage
class Hero: Actor {
    var id: Int = 0
    var Attack: Int = 0
    var Defense: Int = 0
    var MaxHealth: Int = 1
    var CurHealth: Int = 1
    var DisplayPic: String = ""
    var ViewPic: String = ""
    var Name: String = ""
    var Status: [String] = []
    var Abilities: [Attack] = []
    var Armor : Armor? = nil
    var Weapon : Weapon? = nil
}
