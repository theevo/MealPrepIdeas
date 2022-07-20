//
//  RandomMealViewController.swift
//  MealPrepIdeas
//
//  Created by Theo Vora on 7/18/22.
//

import UIKit

class RandomMealViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                    
                    TheMealDBApi.getImageOf(meal: meal) { (result) in
                        switch result {
                        case .success(let image):
                            DispatchQueue.main.async {
                                self.mealImageView.image = image
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
