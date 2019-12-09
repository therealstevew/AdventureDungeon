//
//  Character.swift
//  FinalProd
//
//  Created by Alex Teodorescu on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import Foundation

protocol Actor {
    //Store enemy/hero
    var MaxHealth : Int {get set};
    var CurHealth : Int {get set};
    var DisplayPic : String {get set};
    var Name : String {get set};
    var Status : [String] {get set};
    var Abilities : [Attack] {get set};
    var Attack : Int {get set};
    var Defense : Int {get set};
    
}
