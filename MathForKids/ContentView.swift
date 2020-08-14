//
//  ContentView.swift
//  MathForKids
//
//  Created by Greg Stark on 08/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var maxRange = 6
    @State private var numOfQuestions = 5
    @State private var isPlaying = false
    
    @State private var questions:[Question] = []
    
    var body: some View {
        NavigationView {
            if isPlaying {
                // While playing
                Game(questions: questions, isPlaying: $isPlaying)
                    .navigationBarTitle("MathForKids", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        self.isPlaying = false
                        self.questions = []
                    }, label: {
                        Image(systemName: "xmark")
                    }))
            } else {
                // While showing settings screen
                Settings(maxRange: $maxRange, numOfQuestions: $numOfQuestions, questions: $questions, isPlaying: $isPlaying)
                    .navigationBarTitle("MathForKids", displayMode: .inline)
                    .onAppear(perform: {
                        self.questions = []
                    })
            }
        }
    }
}

