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

    override func viewDidLoad() {
        super.viewDidLoad()
        items = mainDelegate.UserData.Items!
        // Do any additional setup after loading the view.
        lblName.text = mainDelegate.UserData.Party![0].Name
        lblHealth.text = String(mainDelegate.UserData.Party![0].MaxHealth)
        lblAttack.text = String(mainDelegate.UserData.Party![0].Attack)
        lblDefense.text = String(mainDelegate.UserData.Party![0].Defense)
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
        return tableInCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
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
