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
    
    @IBOutlet var parentView: UIView!
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var Confirm: UIButton!
    @IBOutlet weak var rewardsView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit(){
        imgView.layer.cornerRadius = 30
        imgView.layer.borderColor = UIColor.white.cgColor
        
    }
    

}
