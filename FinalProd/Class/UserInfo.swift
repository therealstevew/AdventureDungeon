//
//  UserInfo.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    
    var Heroes : [Hero] = []
    var Items : [Item] = []
    var Party : [Hero] = []
    
    func Saveuser(Name : String, Password : String, Hero1 : Int, Hero2 : Int, Hero3 : Int, Hero4 : Int, Weapon1 : Int, Weapon2 : Int, Weapon3 : Int, Weapon4 : Int, Armour1 : Int, Armour2 : Int, Armour3 : Int, Armour4 : Int){
        print("Saving the user data probally.")
        let Address : URL = URL(string: "http://mckieand.dev.fast.sheridanc.on.ca/finalprod/postUser.php?Name=" + Name + "&Password=" + Password + "&Hero1=" + String(Hero1) + "&Hero2=" + String(Hero2) + "&Hero3=" + String(Hero3) + "&Hero4=" + String(Hero4) + "&Weapon1=" + String(Weapon1) + "&Weapon2=" + String(Weapon2) + "&Weapon3=" + String(Weapon3) + "&Weapon4=" + String(Weapon4) + "&Armour1=" + String(Armour1) + "&Armour2=" + String(Armour2) + "&Armour3=" + String(Armour3) + "&Armour4=" + String(Armour4))!
        let Request : URLRequest = URLRequest(url: Address)
        let Configuration : URLSessionConfiguration = URLSessionConfiguration.default
        let Session : URLSession = URLSession(configuration: Configuration)
        let Task = Session.dataTask(with: Request, completionHandler: {(Data, Response, Error)  in
            print("I tried okay")
            if(Data != nil){
                print(Data)
            }
            if(Response != nil){
                print(Response)
            }
            if(Error != nil){
                print(Error)
            }
        })
        Task.resume()
    }
}
