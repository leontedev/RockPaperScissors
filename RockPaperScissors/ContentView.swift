//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mihai Leonte on 10/18/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
    }
}

extension View {
    func titleStyle() -> some View {
        return self.modifier(Title())
    }
}

struct ContentView: View {
    @State private var options = ["✊", "✋", "✌️"]
    @State private var optionChoice = Int.random(in: 0...2)
    @State private var winChoice = Bool.random()
    @State private var score: Int = 0
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
                VStack {
                    Text("Score: \(score)")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .fontWeight(.heavy)

                    Spacer()
                    
                    ZStack {
                        Color.blue.clipShape(Capsule())
                        VStack {
                            Text(options[optionChoice])
                                .font(.largeTitle)
                                
                            winChoice ?
                                Text("Win this one!")
                                    .fontWeight(.heavy)
                                    .titleStyle()
                                : Text("Loose").titleStyle()
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: { self.buttonTapped(index: 0) }) {
                            Text("✊").font(.largeTitle)
                        }
                        Button(action: { self.buttonTapped(index: 1) }) {
                                Text("✋").font(.largeTitle)
                        }
                        Button(action: { self.buttonTapped(index: 0) }) {
                                Text("✌️").font(.largeTitle)
                        }
                    }.padding(20)
                    
                    Spacer()
                }.padding(100)
            }.navigationBarTitle(Text("RockPaperScissors"))
        }
    }
    
    func buttonTapped(index: Int) {
        switch index {
        case 0:
            if winChoice {
                if optionChoice == 2 {
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if optionChoice == 1 {
                    score += 1
                } else {
                    score -= 1
                }
            }
        case 1:
            if winChoice {
                if optionChoice == 0 {
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if optionChoice == 2 {
                    score += 1
                } else {
                    score -= 1
                }
            }
        case 2:
            if winChoice {
                if optionChoice == 1 {
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if optionChoice == 0 {
                    score += 1
                } else {
                    score -= 1
                }
            }
        default:
            return
        }
        
        
        // start new round
        optionChoice = Int.random(in: 0...2)
        winChoice = Bool.random()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
