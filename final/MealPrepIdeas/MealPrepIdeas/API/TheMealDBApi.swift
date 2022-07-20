//
//  TheMealDBApi.swift
//  MealPrepIdeas
//
//  Created by Theo Vora on 7/18/22.
//

import Foundation

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
}
