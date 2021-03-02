//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Arshmeet Sodhi on 3/2/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        //Loop thorugh the highlights and build the string
        for index in 0..<highlights.count {
            
            //If this is the last item, don't add a comma
            if index == highlights.count - 1{
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["Thing 1", "Thing 2", "Thing 3"])
    }
}
