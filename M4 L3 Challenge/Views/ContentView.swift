//
//  ContentView.swift
//  M4 L3 Challenge
//
//  Created by Arshmeet Sodhi on 2/24/21.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex = 0
    var body: some View {
        
        TabView(selection:$tabIndex) {
            //MARK: - Tab 1
            Text("This tab's tag is \(tabIndex)")
                .tabItem {
                    VStack {
                        Image(systemName: "tortoise")
                        Text("Tab 1")
                    }
                }
            
            //MARK: - Tab 2
            Button(action: {
                tabIndex = 2
            }, label: {
                Text("Take me to tab 3")
            })
            .tabItem {
                VStack {
                    Image(systemName: "arrow.right")
                    Text("Tab 2")
                }
            }
            .tag(1)
            
            //MARK: - Tab 3
            List {
                ForEach(0..<100) { _ in
                    
                    Text("This is tab 3!")
                }
            }
            .tabItem {
                VStack {
                    Image(systemName:"hands.clap.fill")
                    Text("Tab 3")
                }
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
