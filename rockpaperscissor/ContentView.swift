//
//  ContentView.swift
//  rockpaperscissor
//
//  Created by Glenn Gijsberts on 20/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var showScoreAlert = false
    @State private var scoreTitle = "Correct!"
    
    private let options = ["🤜", "🖐", "✌️"]
    
    func pickAnswer(number: Int) {
        if (computerChoice == 0 && number == 1) {
            score += 1
            showScoreAlert = true
            scoreTitle = "Correct!"
        } else if (computerChoice == 1 && number == 2) {
            score += 1
            showScoreAlert = true
            scoreTitle = "Correct!"
        } else if (computerChoice == 2 && number == 0) {
            score += 1
            showScoreAlert = true
            scoreTitle = "Correct!"
        } else {
            showScoreAlert = true
            scoreTitle = "Not correct!"
        }
    }
    
    func nextQuestion() {
        showScoreAlert = false
        computerChoice = Int.random(in: 0...2)
    }
    
    func resetScore() {
        showScoreAlert = false
        computerChoice = Int.random(in: 0...2)
        score = 0
    }
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.98, green: 0.82, blue: 0.76, alpha: 1.00)).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Text("Brain training")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 8)
                    .padding(.top, 48)
                
                Text("Your current score is \(score)")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.bottom, 16)
                
                
                Spacer()
                
                Text(options[computerChoice])
                    .font(.largeTitle)
                    .padding(.bottom, 16)
                
                Text("vs")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 16)
                
                HStack {
                    ForEach(0..<options.count) { option in
                        Button(action: {
                            self.pickAnswer(number: option)
                        }) {
                            Text("\(self.options[option])").font(.largeTitle)
                        }
                    }
                }.padding(.bottom, 88)
            }
        }.alert(isPresented: $showScoreAlert) {
            Alert(title: Text(scoreTitle), message: scoreTitle == "Correct!" ? Text("Nice! +1") : Text("Bummer, next time better!"), dismissButton: .default(Text("Continue")) {
                if (self.score == 10) {
                    self.resetScore()
                } else {
                    self.nextQuestion()
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
