//
//  FeedViewController.swift
//  InsatagramClone
//
//  Created by Asit Aslan on 3.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var tableView: UITableView!
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirestore()
        
    }
    
    
    func getDataFromFirestore(){
        
        
        let fireStoreDatabase = Firestore.firestore()
       
        fireStoreDatabase.collection("Posts").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
                
            }else{
                if snapshot?.isEmpty != true  && snapshot != nil{
                    
                    for document in  snapshot!.documents {
                        
                        let documentID = document.documentID
                        print(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int{
                            self.likeArray.append(likes)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }

                    self.tableView.reloadData()
                }
                                   
            }
        }
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.likeLbl.text = String(likeArray[indexPath.row])
        cell.userEmailLbl.text = userEmailArray[indexPath.row]
        cell.commentViewLbl.text = userCommentArray[indexPath.row]
        cell.imageView?.image = UIImage(named : "select.png")
        return cell
      }
      

}
