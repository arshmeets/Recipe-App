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
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 0) {
            
            Text("Featured Recipes")
                .font(.largeTitle)
                .font(Font.custom("Avenir Heavy", size: 30))
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                
                TabView (selection: $tabSelectionIndex){
                    
                    //Loop thorugh each recipe
                    ForEach (0..<model.recipes.count) { index in
                        
                        //Check which recipes are featured to display
                        if model.recipes[index].featured {
                            
                            //Recipe Card Button
                            Button(action: {
                                
                                //Show the recipe detail sheet
                                self.isDetailViewShowing = true
                            }, label: {
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
                                            .font(Font.custom("Avenir", size: 18))
                                    }
                                }
                                
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
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
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights:model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        
        //Find the first recipe that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
