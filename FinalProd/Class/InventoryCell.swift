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
        secondaryLabel.font = UIFont.systemFont(ofSize: 20)
        secondaryLabel.backgroundColor = UIColor.clear
        secondaryLabel.textColor = UIColor.black
        
        thirdLabel.textAlignment = NSTextAlignment.left
        thirdLabel.font = UIFont.systemFont(ofSize: 20)
        thirdLabel.backgroundColor = UIColor.clear
        thirdLabel.textColor = UIColor.black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(primaryLabel)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(thirdLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        var layout = CGRect(x: 10, y: 5, width: 300, height: 50)
        primaryLabel.frame = layout
        
        layout = CGRect(x: 175, y: 20, width: 100, height: 20)
        secondaryLabel.frame = layout
        
        layout = CGRect(x: 275, y: 20, width: 100, height: 20)
        thirdLabel.frame = layout
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
