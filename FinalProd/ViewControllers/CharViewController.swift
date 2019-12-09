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
    
    @IBOutlet var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(mainDelegate.UserData.Party!.count > 3){
            imgFour.image = UIImage(named: mainDelegate.UserData.Party![3].ViewPic)
            lblFour.text = mainDelegate.UserData.Party![3].Name
        }
        if(mainDelegate.UserData.Party!.count > 2){
            imgThree.image = UIImage(named: mainDelegate.UserData.Party![2].ViewPic)
            lblThree.text = mainDelegate.UserData.Party![2].Name
        }
        if(mainDelegate.UserData.Party!.count > 1){
            imgTwo.image = UIImage(named: mainDelegate.UserData.Party![1].ViewPic)
            lblTwo.text = mainDelegate.UserData.Party![1].Name
        }
        if(mainDelegate.UserData.Party!.count > 0){
            imgOne.image = UIImage(named: mainDelegate.UserData.Party![0].ViewPic)
            lblOne.text = mainDelegate.UserData.Party![0].Name
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainDelegate.UserData.Heroes!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCharCell : CharCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CharCell ?? CharCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let rowNum = indexPath.row
        let name = mainDelegate.UserData.Heroes![rowNum].Name
        let imgName = UIImage(named:mainDelegate.UserData.Heroes![rowNum].ViewPic)
        
        tableCharCell.primaryLabel.text = name
        tableCharCell.myImageView.image = imgName
        tableCharCell.backgroundColor = .brown
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
        tableView.reloadData()
    }
<<<<<<< HEAD
    @IBAction func unwindToCharViewController(segue: UIStoryboardSegue)
    {
        
    }
=======
>>>>>>> 2ff64592e96cdb5be5153b36614d2842598d026b
}
