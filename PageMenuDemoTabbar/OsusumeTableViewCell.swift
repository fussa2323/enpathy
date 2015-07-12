//
//  OsusumeTableViewCell.swift
//  PageMenuDemoTabbar
//
//  Created by Yohei Fusayasu on 7/11/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit

class OsusumeTableViewCell: UITableViewCell {

  @IBOutlet weak var tagLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var totalNum: UILabel!
  @IBOutlet weak var joinNum: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var placeLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
