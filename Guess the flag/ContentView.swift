//
//  ContentView.swift
//  Guess the flag
//
//  Created by iresh sharma on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    var countriesList = ["Estonia", "Nigeria", "Spain", "Germany", "Italy", "Russia", "UK", "US", "France", "Poland", "Monaco", "Ireland"].shuffled()
    var correctAnswer = Int.random(in: 0..<3)
    
    @State private var showAlert: Bool = false
    @State private var alertTile: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Guess the flag !?").font(.title3).fontWeight(.thin)
                Text(countriesList[correctAnswer]).font(.largeTitle).fontWeight(.black)
            }
            VStack(spacing: 60) {
                ForEach(0..<3) { number in
                    Image(countriesList[number])
                        .onTapGesture {
                            self.tapp(number)
                        }
                        .shadow(radius: /*@START_MENU_TOKEN@*/20/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(alertTile), dismissButton: .default(Text("ok")))
        })
    }
    
    func tapp(_ number: Int) {
        if number == correctAnswer {
            alertTile = "Correct Answer"
            showAlert = true
        } else {
            alertTile = "Incorrect Answer"
            showAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
