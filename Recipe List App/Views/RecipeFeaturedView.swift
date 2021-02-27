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
        
        VStack(alignment:.leading, spacing: 0) {
            Text("Featured Recipes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40)
            
        GeometryReader { geo in
            
            TabView{
                
                //Loop thorugh each recipe
                ForEach (0..<model.recipes.count) { index in
                    
                    //Check which recipes are featured to display
                    if model.recipes[index].featured {
                        
                        //Recipe card
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                            VStack(spacing: 0) {
                                Image(model.recipes[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                Text(model.recipes[index].name)
                                    .padding(5)
                            }
                        }
                        .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                    }
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            
            VStack(alignment:.leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights:")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
