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
    var strIngredient1: String
    var strIngredient2: String
    var strIngredient3: String
    var strIngredient4: String
    var strIngredient5: String
    var strIngredient6: String
    var strIngredient7: String
    var strIngredient8: String
    var strIngredient9: String
    var strIngredient10: String
    var strIngredient11: String
    var strIngredient12: String
    var strIngredient13: String
    var strIngredient14: String
    var strIngredient15: String
    var strIngredient16: String
    var strIngredient17: String
    var strIngredient18: String
    var strIngredient19: String
    var strIngredient20: String
    var strInstructions: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case imageUrlString = "strMealThumb"
        case id = "idMeal"
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strInstructions
    }
}

struct MealsResponse: Decodable {
    var meals: [Meal]
}

extension Meal {
    var mealPrep: String {
        var string =
"""
Ingredients\n
case strIngredient1
case strIngredient2
case strIngredient3
case strIngredient4
case strIngredient5
case strIngredient6
case strIngredient7
case strIngredient8
case strIngredient9
"""
        return string
    }
}
