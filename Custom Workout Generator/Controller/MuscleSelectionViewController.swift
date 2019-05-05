//
//  MuscleSelectionViewController.swift
//  Custom Workout Generator
//
//  Created by Andrew Chang on 5/4/19.
//  Copyright © 2019 Ethan Daniel. All rights reserved.
//

import UIKit

class MuscleSelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "muscleCell", for: indexPath) as? MuscleCollectionViewCell {
            cell.imageView.image = UIImage(named: data.images[indexPath.row])
            cell.imageView.contentMode = .scaleAspectFill
            return cell
        }
        return UICollectionViewCell()
    }
    
    @IBOutlet weak var muscleCollectionView: UICollectionView!
    

    @IBOutlet weak var shoulders: UIButton!
    @IBOutlet weak var abs: UIButton!
    @IBOutlet weak var biceps: UIButton!
    @IBOutlet weak var chest: UIButton!
    @IBOutlet weak var forearms: UIButton!
    @IBOutlet weak var obliques: UIButton!
    @IBOutlet weak var quads: UIButton!
    @IBOutlet weak var traps: UIButton!
    @IBOutlet weak var lats: UIButton!
    @IBOutlet weak var lowerback: UIButton!
    @IBOutlet weak var triceps: UIButton!
    @IBOutlet weak var glutes: UIButton!
    @IBOutlet weak var hamstrings: UIButton!
    @IBOutlet weak var calves: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
