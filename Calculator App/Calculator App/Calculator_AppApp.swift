//
//  Calculator_AppApp.swift
//  Calculator App
//
//  Created by Arshmeet Sodhi on 3/3/21.
//

import SwiftUI

@main
struct Calculator_AppApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorHome()
                .environmentObject(Calculator())
        }
    }
}
