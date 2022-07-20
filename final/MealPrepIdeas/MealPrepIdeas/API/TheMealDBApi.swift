//
//  TheMealDBApi.swift
//  MealPrepIdeas
//
//  Created by Theo Vora on 7/18/22.
//

import Foundation
import UIKit

class TheMealDBApi {
    static func getRandomMeal(completion: @escaping (Result<Meal, TheMealDBApiError>) -> Void ) {
        guard let randomMealUrl = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else { return completion(.failure(.invalidURL)) }
        
        print("calling \(randomMealUrl.absoluteString)")
        
        URLSession.shared.dataTask(with: randomMealUrl) { (data, _, error) in
            
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.invalidURL))
            }
            
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
                
                guard let meal = decodedResponse.meals.first else { return completion(.failure(.badData)) }
                
                return completion(.success(meal))
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
        }.resume()
    }
    
    static func getImageOf(meal: Meal, completion: @escaping (Result<UIImage, TheMealDBApiError>) -> Void) {
        guard let imageUrl = URL(string: meal.imageUrlString) else { return completion(.failure(.invalidURL)) }
        
        print("calling \(imageUrl.absoluteString)")
        
        URLSession.shared.dataTask(with: imageUrl) { (data, _, error) in

            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.invalidURL))
            }

            guard let data = data else {
                return completion(.failure(.noData))
            }

            guard let image = UIImage(data: data)
            else { return completion(.failure(.noImage)) }

            return completion(.success(image))
        }.resume()
    }
}
