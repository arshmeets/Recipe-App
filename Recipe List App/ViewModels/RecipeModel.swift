//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Arshmeet Sodhi on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
            
    }
    
    static func getPortion(ingredient:Ingredients, recipeServings:Int, targetServings:Int) -> String {
        
        // Get a single serving size by multiplying denominator by the recipe servings
        
        // Get target portion by multiplying numerator by target servings
        
        // Reduce fraction by the greatest common divisor
        
        // Get the whole portion if numerator > denominator
        
        // Express the remainder as a fraction
        
        return String(targetServings)
    }
}
