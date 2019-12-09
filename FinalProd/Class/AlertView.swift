//
//  AlertView.swift
//  FinalProd
//
//  Created by Steven Winstanley on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit
import Foundation
class AlertView: UIView {
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "AlertView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
       }
    
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var Confirm: UIButton!
    @IBOutlet weak var rewardsView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func showAlert(Rewards: Array<String>, type: String){
        let typeString : String? = type
        switch typeString {
        case "1":
            imgView.image = UIImage(named: "tavern.png")
        case "2":
            imgView.image = UIImage(named: "vendor.png")
        case "3":
            imgView.image = UIImage(named: "redcross.png")
        default:
            imgView.image = UIImage(named: "battle.png")
        }
        
    }
    

}
