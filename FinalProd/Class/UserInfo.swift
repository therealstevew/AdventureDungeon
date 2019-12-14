//
//  UserInfo.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    
    // Holds all the data about the user
    
    var Heroes : [Hero]?
    var Items : [Item]?
    var Party : [Hero]?
    var UserName: String = ""
    var Password: String = ""
    
    // Saves the user's progress to the sql to be viewed on TV
    
    func Saveuser(Name : String, Password : String, Hero1 : Int, Hero2 : Int, Hero3 : Int, Hero4 : Int, Weapon1 : Int, Weapon2 : Int, Weapon3 : Int, Weapon4 : Int, Armour1 : Int, Armour2 : Int, Armour3 : Int, Armour4 : Int){
        print("Saving the user data probally.")
        let Address : URL = URL(string: "http://mckieand.dev.fast.sheridanc.on.ca/finalprod/postUserNew.php?Name=" + Name + "&Password=" + Password + "&Hero1=" + String(Hero1) + "&Hero2=" + String(Hero2) + "&Hero3=" + String(Hero3) + "&Hero4=" + String(Hero4) + "&Weapon1=" + String(Weapon1) + "&Weapon2=" + String(Weapon2) + "&Weapon3=" + String(Weapon3) + "&Weapon4=" + String(Weapon4) + "&Armour1=" + String(Armour1) + "&Armour2=" + String(Armour2) + "&Armour3=" + String(Armour3) + "&Armour4=" + String(Armour4))!
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
    
    // Initializes the user
    
    // If user data saved locally, loads that, else makes a new user
    
    override init() {
        print("loading")
        let defaults = UserDefaults.standard
        Heroes = []
        Items = []
        Party = []
        if(defaults.object(forKey: "Exists") != nil) {
            print("there is data")
            let HeroData : [Int] = defaults.array(forKey: "Heroes") as! [Int]
            let ItemData : [Int] = defaults.array(forKey: "Items") as! [Int]
            let PartyData : [Int] =  defaults.array(forKey: "Party") as! [Int]
            for datum in HeroData {
                Heroes!.append(DataStore.getHero(Which: datum))
            }
            for datum in ItemData {
                Items!.append(DataStore.getitem(Which: datum))
            }
            for datum in PartyData {
                Party!.append(DataStore.getHero(Which: datum))
            }
        } else {
            print("there was no data")
            Heroes = []
            Items = []
            Party = [DataStore.getHero(Which: Int.random(in: 0...7))]
        }
    }
    
    // Saves the user to both the online cloud and
    
    func LocalSave(){
        print("Saving")
        
        // Saves data as ints because can't save custom objects easily
        
        let defaults = UserDefaults.standard
        var HeroData : [Int] = []
        var ItemData : [Int] = []
        var PartyData : [Int] = []
        for hero in Heroes! {
            HeroData.append(hero.id)
        }
        for item in Items! {
            ItemData.append(item.id)
        }
        for hero in Party! {
            PartyData.append(hero.id)
        }
        
        
        print(HeroData)
        print(ItemData)
        print(PartyData)
        
        // store stuff locally
        
        defaults.set(HeroData, forKey: "Heroes")
        defaults.set(ItemData, forKey: "Items")
        defaults.set(PartyData, forKey: "Party")
        defaults.set(true, forKey: "Exists")



        
        // convert party into ints for online database, -1 denotes empty without sending null cause that's a pain in swift
        
        var dude1 : Int = -1
        var dude2 : Int = -1
        var dude3 : Int = -1
        var dude4 : Int = -1
        
        if(Party!.count > 3){
            dude4 = Party![3].id
        }
        if(Party!.count > 2){
            dude3 = Party![2].id
        }
        if(Party!.count > 1){
            dude2 = Party![1].id
        }
        if(Party!.count > 0){
            dude1 = Party![0].id
        }
        
        Saveuser(Name: UserName, Password: Password, Hero1: dude1, Hero2: dude2, Hero3: dude3, Hero4: dude4, Weapon1: 0, Weapon2: 0, Weapon3: 0, Weapon4: 0, Armour1: 0, Armour2: 0, Armour3: 0, Armour4: 0)

    }
}
