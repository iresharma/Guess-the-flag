//
//  ContentView.swift
//  Guess the flag
//
//  Created by iresh sharma on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countriesList = ["Estonia", "Nigeria", "Spain", "Germany", "Italy", "Russia", "UK", "US", "France", "Poland", "Monaco", "Ireland"].shuffled()
    @State private var correctAnswer = Int.random(in: 0..<3)
    
    @State private var showAlert: Bool = false
    @State private var alertTile: String = ""
    @State private var score: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Guess the flag !?").font(.title3).fontWeight(.thin)
                Text(countriesList[correctAnswer]).font(.largeTitle).fontWeight(.black)
            }.padding(.top) 
            Spacer()
            VStack(spacing: 60) {
                ForEach(0..<3) { number in
                    Image(countriesList[number])
                        .resizable()
                        .frame(width: 300.0)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .onTapGesture {
                            self.tapp(number)
                        }
                        .shadow(radius: /*@START_MENU_TOKEN@*/20/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
            VStack {
                Text("Score").fontWeight(.semibold).foregroundColor(.black)
                Text("\(score)").fontWeight(.black).foregroundColor(.green).font(.largeTitle)
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(alertTile), dismissButton: .default(Text("ok")) {
                self.newQuse()
            })
        })
    }
    
    func tapp(_ number: Int) {
        if number == correctAnswer {
            alertTile = "Correct Answer"
            score += 1
        } else {
            alertTile = "Incorrect Answer"
        }
        
        showAlert = true
    }
    
    func newQuse() {
        countriesList.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
