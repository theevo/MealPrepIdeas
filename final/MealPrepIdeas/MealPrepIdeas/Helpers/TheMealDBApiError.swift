//
//  TheMealDBApiError.swift
//  MealPrepIdeas
//
//  Created by Theo Vora on 7/19/22.
//

import Foundation

enum TheMealDBApiError: LocalizedError {
    case thrown(Error)
    case invalidURL
    case noData
    case badData
    case noImage
    
    var errorDescription: String? {
        switch self {
            
        case .thrown(let error):
            return error.localizedDescription
        case .invalidURL:
            return "Unable to reach server."
        case .noData:
            return "Server responded with no data."
        case .badData:
            return "Server returned bad data."
        case .noImage:
            return "No image."
        }
    }
}
