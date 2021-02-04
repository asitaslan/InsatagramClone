//
//  FeedCell.swift
//  InsatagramClone
//
//  Created by Asit Aslan on 3.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var commentViewLbl: UILabel!
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var documentIdLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
              if let likeCount = Int(likeLbl.text!){
                  
                  let likeStore = ["likes" : likeCount + 1]  as [String: Any]
                  fireStoreDatabase.collection("Posts").document(documentIdLbl.text!).setData(likeStore, merge: true)
                  
              }
              
        
    }
}
