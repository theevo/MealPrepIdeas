//
//  Meal.swift
//  MealPrepIdeas
//
//  Created by Theo Vora on 7/18/22.
//

import Foundation

struct Meal: Decodable {
    var name: String
    var imageUrlString: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case imageUrlString = "strMealThumb"
        case id = "idMeal"
    }
}

struct MealsResponse: Decodable {
    var meals: [Meal]
}
