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
                            Image("lasagna")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            Text("Lasagna")
                                .padding(5)
                        }
                    }
                    .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                    .cornerRadius(15)
                    .shadow(radius: 20)
                }
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
