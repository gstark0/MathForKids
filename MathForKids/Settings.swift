//
//  Settings.swift
//  MathForKids
//
//  Created by Greg Stark on 09/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @Binding var maxRange: Int
    @Binding var numOfQuestions: Int
    @Binding var questions: [Question]
    @Binding var isPlaying: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Avatar(avatar: "pig")
                .padding(.bottom, 40)
            VStack {
                Stepper(value: $maxRange, in: 2...12) {
                    Text("Range of numbers: \(self.maxRange)")
                }
                    .padding(.horizontal)
                Stepper(value: $numOfQuestions, in: 4...30) {
                    Text("Number of questions: \(self.numOfQuestions)")
                }
                    .padding(.horizontal)
            }
            Spacer()
            BottomButton(text: "Let's go!", onPress: {
                self.generateQuestions()
                self.isPlaying = true
            })
        }
    }
    
    // TODO - Generate addition/substraction/multiplication/division questions
    func generateQuestions() {
        for _ in 0..<numOfQuestions {
            let question = Question(type: .addition, firstNumber: Int.random(in: 1...maxRange), secondNumber: Int.random(in: 1...maxRange))
            questions.append(question)
        }
    }
}

enum QuestionType {
    case addition
    case substruction
    case multiplication
    case division
}

struct Question {
    var type: QuestionType
    var firstNumber: Int
    var secondNumber: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
