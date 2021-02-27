//
//  ContentView.swift
//  Recipe List App
//
//  Created by Arshmeet Sodhi on 2021-01-14.
//

import SwiftUI

struct RecipeListView: View {
    
    //Creating the instance of the Recipe Model Class
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                            ForEach(model.recipes) { r in
                        NavigationLink(
                            destination: RecipeDetailView(recipe:r),
                            label: {
                                
                                // MARK: Row item
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                }
                                
                            })
                    
                }
                    }
                }
            }
            .padding(.leading)
            .navigationBarHidden(true)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
