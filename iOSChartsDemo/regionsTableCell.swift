//
//  regionsTableCell.swift
//  iOSChartsDemo
//
//  Created by User07 on 2019/1/7.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import UIKit

class regionsTableCell: UITableViewCell {

    @IBOutlet weak var station: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
