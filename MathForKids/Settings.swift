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
    
    // Choose question type
    //var questionsType: QuestionType = .addition
    @State private var questionType = 0
    
    var body: some View {
        VStack {
            Spacer()
            Avatar(avatar: "pig")
                .padding(.bottom, 40)
            VStack() {
                Picker(selection: $questionType, label: Text("What do you want to practice?")) {
                    Image(systemName: "plus").tag(0)
                    Image(systemName: "minus").tag(1)
                    Image(systemName: "multiply").tag(2)
                }
                    .labelsHidden()
                    .padding(.horizontal)
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 30)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.06), radius: 0, x: 0, y: 8)
                Stepper(value: $maxRange, in: 2...12) {
                    Text(String(self.maxRange))
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .font(.system(size: 24))
                        .background(Color(red: 29/255, green: 176/255, blue: 246/255))
                        .cornerRadius(100)
                    VStack(alignment: .leading) {
                        Text("Range of numbers")
                            .bold()
                            .padding(.bottom, 5)
                        Text("Bigger range means bigger numbers")
                    }
                }
                    .padding(.horizontal)
                Divider()
                    .padding()
                Stepper(value: $numOfQuestions, in: 4...30) {
                    Text(String(self.numOfQuestions))
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .font(.system(size: 24))
                        .background(Color("Basic"))
                        .cornerRadius(100)
                    VStack(alignment: .leading) {
                        Text("Number of questions")
                            .bold()
                            .padding(.bottom, 5)
                        Text("More is more challanging")
                    }
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
