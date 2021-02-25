//
//  ContentView.swift
//  M4 L4 Challenge
//
//  Created by Arshmeet Sodhi on 2/24/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(.green)
                        .onTapGesture {
                            print("Width: \(geo.size.width), Height: \(geo.size.height)")
                        }
                    GeometryReader{ geo in
                        Rectangle()
                            .position(x: geo.size.width/2, y: geo.size.height/2)
                            .foregroundColor(.red)
                            .frame(width: geo.size.width*2/3, height: geo.size.height/4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                print("Width: \(geo.size.width * 2/3), Height: \(geo.size.height/4)")
                            }
                    }
                }
            }
            HStack(spacing: 0) {
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(.purple)
                        .onTapGesture {
                            print("Width: \(geo.size.width), Height: \(geo.size.height)")
                        }
                }
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(.orange)
                        .onTapGesture {
                            print("Width: \(geo.size.width), Height: \(geo.size.height)")
                        }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
