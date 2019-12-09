//
//  ExpandViewController.swift
//  FinalProd
//
//  Created by Christopher Reynolds on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var items : Array<Item> = []
    
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblHealth : UILabel!
    @IBOutlet var lblAttack : UILabel!
    @IBOutlet var lblDefense : UILabel!
    @IBOutlet var lblWeapon : UILabel!
    @IBOutlet var lblArmour : UILabel!
    @IBOutlet var imgIcon : UIImageView!
    
    var choice = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        items = mainDelegate.UserData.Items!
        // Do any additional setup after loading the view.
        lblName.text = mainDelegate.UserData.Party![0].Name
        lblHealth.text = String(mainDelegate.UserData.Party![0].MaxHealth)
        lblAttack.text = String(mainDelegate.UserData.Party![0].Attack)
        lblDefense.text = String(mainDelegate.UserData.Party![0].Defense)
        lblWeapon.text = String(mainDelegate.UserData.Party![0].Weapon?.Name ?? "None Eqipped")
        lblArmour.text = String(mainDelegate.UserData.Party![0].Armor?.Name ?? "None Eqipped")
        imgIcon.image = UIImage(named: mainDelegate.UserData.Party![0].ViewPic)
        

        let image: UIImage = UIImage(named: mainDelegate.UserData.Heroes![0].ViewPic)!
        imgIcon.image = image

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.UserData.Items!.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableInCell : EquipTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? EquipTableViewCell ?? EquipTableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        print(items[0].Name)
        tableInCell.primaryLabel.text = String(items[rowNum].Name)
        tableInCell.secondaryLabel.text = String(items[rowNum].Characteristic)
        tableInCell.thirdLabel.text = String(items[rowNum].ItemType)
        tableInCell.backgroundColor = .brown
        return tableInCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*lblFour.text = lblThree.text
        lblThree.text = lblTwo.text
        lblTwo.text = lblOne.text
        imgFour.image = imgThree.image
        imgThree.image = imgTwo.image
        imgTwo.image = imgOne.image
        lblOne.text = mainDelegate.UserData.Heroes![indexPath.row].Name
        imgOne.image = UIImage(named: mainDelegate.UserData.Heroes![indexPath.row].ViewPic)!
        if mainDelegate.UserData.Party!.count == 4 {
            mainDelegate.UserData.Heroes!.append(mainDelegate.UserData.Party!.first!)
            mainDelegate.UserData.Party!.removeFirst()
            mainDelegate.UserData.Party!.append(mainDelegate.UserData.Heroes![indexPath.row])
        } else {
            mainDelegate.UserData.Party!.append(mainDelegate.UserData.Heroes![indexPath.row])
        }
        mainDelegate.UserData.Heroes!.remove(at: indexPath.row)
        mainDelegate.UserData.LocalSave()
        tableView.reloadData()*/
        if mainDelegate.UserData.Items![indexPath.row].ItemType == "Weapon" {
            lblWeapon.text = mainDelegate.UserData.Items![indexPath.row].Name
            mainDelegate.UserData.Party![choice].Weapon?.onUnequip(User: mainDelegate.UserData.Party![choice])
            mainDelegate.UserData.Party![choice].Weapon = mainDelegate.UserData.Items![indexPath.row] as! Weapon
            mainDelegate.UserData.Party![choice].Weapon?.onEquip(User: mainDelegate.UserData.Party![choice])
            lblAttack.text = String(mainDelegate.UserData.Party![choice].Attack)
            lblHealth.text = String(mainDelegate.UserData.Party![choice].MaxHealth)
        }
        if mainDelegate.UserData.Items![indexPath.row].ItemType == "Armour" {
            lblArmour.text = mainDelegate.UserData.Items![indexPath.row].Name
            mainDelegate.UserData.Party![choice].Armor?.onUnequip(User: mainDelegate.UserData.Party![choice])
            mainDelegate.UserData.Party![choice].Armor = mainDelegate.UserData.Items![indexPath.row] as! Armor
            mainDelegate.UserData.Party![choice].Armor?.onEquip(User: mainDelegate.UserData.Party![choice])
            lblDefense.text = String(mainDelegate.UserData.Party![choice].Defense)
        }
    }
    
        @IBAction func displayOne(sender: UIButton){
        choice = 0
        lblName.text = mainDelegate.UserData.Party![0].Name
        lblHealth.text = String(mainDelegate.UserData.Party![0].MaxHealth)
        lblAttack.text = String(mainDelegate.UserData.Party![0].Attack)
        lblDefense.text = String(mainDelegate.UserData.Party![0].Defense)
        imgIcon.image = UIImage(named: mainDelegate.UserData.Party![0].ViewPic)
        lblWeapon.text = String(mainDelegate.UserData.Party![0].Weapon?.Name ?? "None Eqipped")
        lblArmour.text = String(mainDelegate.UserData.Party![0].Armor?.Name ?? "None Eqipped")
        
    }
        @IBAction func displayTwo(sender: UIButton){
        if mainDelegate.UserData.Party!.count >= 2{
            choice = 1
            lblName.text = mainDelegate.UserData.Party![1].Name
            lblHealth.text = String(mainDelegate.UserData.Party![1].MaxHealth)
            lblAttack.text = String(mainDelegate.UserData.Party![1].Attack)
            lblDefense.text = String(mainDelegate.UserData.Party![1].Defense)
            imgIcon.image = UIImage(named: mainDelegate.UserData.Party![1].ViewPic)
            lblWeapon.text = String(mainDelegate.UserData.Party![1].Weapon?.Name ?? "None Eqipped")
            lblArmour.text = String(mainDelegate.UserData.Party![1].Armor?.Name ?? "None Eqipped")
        }
    }
        @IBAction func displayThree(sender: UIButton){
        if mainDelegate.UserData.Party!.count >= 3{
            choice = 2
            lblName.text = mainDelegate.UserData.Party![2].Name
            lblHealth.text = String(mainDelegate.UserData.Party![2].MaxHealth)
            lblAttack.text = String(mainDelegate.UserData.Party![2].Attack)
            lblDefense.text = String(mainDelegate.UserData.Party![2].Defense)
            imgIcon.image = UIImage(named: mainDelegate.UserData.Party![2].ViewPic)
            lblWeapon.text = String(mainDelegate.UserData.Party![2].Weapon?.Name ?? "None Eqipped")
            lblArmour.text = String(mainDelegate.UserData.Party![2].Armor?.Name ?? "None Eqipped")
        }
    }
        @IBAction func displayFour(sender: UIButton){
        if mainDelegate.UserData.Party!.count >= 4{
            choice = 3
            lblName.text = mainDelegate.UserData.Party![3].Name
            lblHealth.text = String(mainDelegate.UserData.Party![3].MaxHealth)
            lblAttack.text = String(mainDelegate.UserData.Party![3].Attack)
            lblDefense.text = String(mainDelegate.UserData.Party![3].Defense)
            imgIcon.image = UIImage(named: mainDelegate.UserData.Party![3].ViewPic)
            lblWeapon.text = String(mainDelegate.UserData.Party![3].Weapon?.Name ?? "None Eqipped")
            lblArmour.text = String(mainDelegate.UserData.Party![3].Armor?.Name ?? "None Eqipped")
        }
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
