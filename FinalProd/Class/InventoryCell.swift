//
//  InventoryCell.swift
//  FinalProd
//
//  Created by Andrew Mckie on 2019-12-08.
//  Copyright © 2019 Steven Winstanley. All rights reserved.
//

import UIKit

class InventoryCell: UITableViewCell {

    let primaryLabel = UILabel()
    let secondaryLabel = UILabel()
    let thirdLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        primaryLabel.textAlignment = NSTextAlignment.left
        primaryLabel.font = UIFont.boldSystemFont(ofSize: 30)
        primaryLabel.backgroundColor = UIColor.clear
        primaryLabel.textColor = UIColor.black
        
        secondaryLabel.textAlignment = NSTextAlignment.left
        secondaryLabel.font = UIFont.systemFont(ofSize: 30)
        secondaryLabel.backgroundColor = UIColor.clear
        secondaryLabel.textColor = UIColor.black
        
        thirdLabel.textAlignment = NSTextAlignment.left
        thirdLabel.font = UIFont.systemFont(ofSize: 30)
        thirdLabel.backgroundColor = UIColor.clear
        thirdLabel.textColor = UIColor.black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(primaryLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let layout1 = CGRect(x: 100, y: 5, width: 460, height: 30)
        primaryLabel.frame = layout1
        
        let layout2 = CGRect(x: 300, y: 5, width: 460, height: 30)
        secondaryLabel.frame = layout2
        
        let layout3 = CGRect(x: 500, y: 10, width: 460, height: 30)
        thirdLabel.frame = layout3
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
