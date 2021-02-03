//
//  FeedCell.swift
//  InsatagramClone
//
//  Created by Asit Aslan on 3.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var commentViewLbl: UILabel!
    @IBOutlet weak var likeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
    }
}
