//
//  CharViewController.swift
//  FinalProd
//
//  Created by Christopher Reynolds on 2019-12-07.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class CharViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var partyHeroes : Array<Hero> = []
    
    @IBOutlet var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if mainDelegate.UserData.Heroes.count == 0{
            mainDelegate.UserData.Heroes.append(DataStore.getHero(Which: 0))
        }
    }
    
    @IBOutlet var lblOne : UILabel!
    @IBOutlet var lblTwo : UILabel!
    @IBOutlet var lblThree : UILabel!
    @IBOutlet var lblFour : UILabel!
    
    @IBOutlet var imgOne : UIImageView!
    @IBOutlet var imgTwo : UIImageView!
    @IBOutlet var imgThree : UIImageView!
    @IBOutlet var imgFour : UIImageView!
    
    @IBOutlet var buttonSubmit : UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainDelegate.UserData.Heroes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCharCell : CharCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CharCell ?? CharCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let rowNum = indexPath.row
        let name = mainDelegate.UserData.Heroes[rowNum].Name
        let imgName = UIImage(named:mainDelegate.UserData.Heroes[rowNum].ViewPic)
        
        tableCharCell.primaryLabel.text = name
        tableCharCell.myImageView.image = imgName
        
        tableCharCell.accessoryType = .disclosureIndicator
        
        return tableCharCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lblFour.text = lblThree.text
        lblThree.text = lblTwo.text
        lblTwo.text = lblOne.text
        imgFour.image = imgThree.image
        imgThree.image = imgTwo.image
        imgTwo.image = imgOne.image
        lblOne.text = mainDelegate.UserData.Heroes[indexPath.row].Name
        let image: UIImage = UIImage(named: mainDelegate.UserData.Heroes[indexPath.row].ViewPic)!
        imgOne.image = image
        if partyHeroes.count == 4{
            partyHeroes.removeFirst()
            //partyHeroes.append(DataStore.getHero(Which: <#T##Int#>))
        } else {
            //partyHeroes.append()
        }
    }
}
