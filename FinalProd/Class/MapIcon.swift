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
    var lat : Float = 0.0
    var long : Float = 0.0
    
    //create a random point within the map
     init(coordLat: Float, coordLong: Float) {
        lat = coordLat
        long = coordLong
        var rand = Float.random(in: 0 ..< 0.0018)
        type = Int.random(in: 0 ..< 4)
        lat -= 0.0009
        lat += rand
        rand = Float.random(in: 0 ..< 0.0018)
        long -= 0.0009
        long += rand
        
        

       
    }
    
}
