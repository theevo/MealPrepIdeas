//
//  RandomMealViewController.swift
//  MealPrepIdeas
//
//  Created by Theo Vora on 7/18/22.
//

import UIKit

class RandomMealViewController: UIViewController {
    
    // MARK: - Properties
    var meal: Meal?
    var mealImage: UIImage?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnMeal))

        nameLabel.addGestureRecognizer(tapGesture)
        mealImageView.addGestureRecognizer(tapGesture)
        
        // make sure imageView can be interacted with by user
        nameLabel.isUserInteractionEnabled = true
        mealImageView.isUserInteractionEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        mealImageView.image = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TheMealDBApi.getRandomMeal {
            (result) in
            switch result {
            case .success(let meal):
                DispatchQueue.main.async {
                    self.nameLabel.text = meal.name
                    self.meal = meal
                    
                    TheMealDBApi.getImageOf(meal: meal) { (result) in
                        switch result {
                        case .success(let image):
                            DispatchQueue.main.async {
                                self.mealImageView.image = image
                                self.mealImage = image
                            }
                        case .failure(let error):
                            self.mealImageView.image = UIImage(named: "hamster_ate_your_meal")
                            print(error, error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error, error.localizedDescription)
            }
        }
    }
    
    @objc func tapOnMeal(_: UIGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MealDetailViewController") as! MealDetailViewController
        present(vc, animated: true)
    }
}
