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
    
    override func viewWillAppear(_ animated: Bool) {
        TheMealDBApi.getRandomMeal {
            (result) in
            switch result {
            case .success(let meal):
                DispatchQueue.main.async {
                    self.nameLabel.text = meal.name
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
