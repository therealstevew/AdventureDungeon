//
//  InventoryViewController.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var items : Array<Item> = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.UserData.Items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableInCell : InventoryCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? InventoryCell ?? InventoryCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        tableInCell.primaryLabel.text = String(items[rowNum].Name)
        tableInCell.secondaryLabel.text = String(items[rowNum].Characteristic)
        tableInCell.thirdLabel.text = String(items[rowNum].ItemType)
        return tableInCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = mainDelegate.UserData.Items!
        
        
         
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
