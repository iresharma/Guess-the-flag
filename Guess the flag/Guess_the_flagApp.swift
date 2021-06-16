//
//  Guess_the_flagApp.swift
//  Guess the flag
//
//  Created by iresh sharma on 16/06/21.
//

import SwiftUI

@main
struct Guess_the_flagApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                LinearGradient(gradient: Gradient(
                                colors: [.blue, Color.blue.opacity(0.7)]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ContentView()
            }
        }
    }
}
