//
//  MealDetailViewController.swift
//  MealPrepIdeas
//
//  Created by Theo Vora on 7/20/22.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var meal: Meal? // landing pad
    var mealImage: UIImage?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealPrepTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = meal?.name
        mealPrepTextView.text = meal?.mealPrep
    }

}
