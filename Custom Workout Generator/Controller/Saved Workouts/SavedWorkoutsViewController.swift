//
//  SavedWorkoutsViewController.swift
//  Custom Workout Generator
//
//  Created by Ethan Daniel on 5/5/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit
import Firebase

class SavedWorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    @IBOutlet weak var savedWorkoutsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedWorkoutsTableView.dataSource = self
        savedWorkoutsTableView.delegate = self
        ref = Database.database().reference()
        if let currentUser = Auth.auth().currentUser {
            let userWorkoutsRef = ref.child("Saved Workouts").child(currentUser.uid)
            userWorkoutsRef.observeSingleEvent(of: .value) { (snapshot) in
                for _ in 0 ..< snapshot.childrenCount{
                    
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
