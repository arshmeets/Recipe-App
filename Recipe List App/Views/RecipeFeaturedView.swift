//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Arshmeet Sodhi on 2/25/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    //Creating the instance of the Recipe Model Class
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        Text("Hello, World")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
