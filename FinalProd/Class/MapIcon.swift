//
//  MapIcon.swift
//  FinalProd
//
//  Created by Steven Winstanley on 2019-11-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
///
class MapIcon: NSObject {
    //0 Dungeon
    //1 Tavern
    //2 Vender
    //3 Healer
    var type : Int = 1;
    
    override init() {
        type = Int.random(in: 0 ..< 4)
    }
    
}
