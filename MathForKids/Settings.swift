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
    @State private var questionType = 0
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack(spacing: 40) {
                    VStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("DataText"))
                            .font(.system(size: 24))
                            .padding(.top, 5)
                        Text("178")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("DataText"))
                    }
                        .frame(width: 70, height: 70)
                        .background(Color("Background"))
                        .cornerRadius(8)
                    
                    Avatar(avatar: "pig")
                        .padding(.bottom, 20)
                    
                    VStack {
                        Image(systemName: "hare.fill")
                            .foregroundColor(Color("DataText"))
                            .font(.system(size: 24))
                            .padding(.top, 5)
                        Text("4/20")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("DataText"))
                    }
                        .frame(width: 70, height: 70)
                        .background(Color("Background"))
                        .cornerRadius(8)
                }
                Text("My profile")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkText"))
                    .padding(.bottom, 20)
                Divider()
                    .padding(.bottom, 20)
                    .padding(.horizontal)
            }
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
                        Text("Bigger range means bigger numbers and more coins")
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
                        Text("For each question you can earn 10 coins")
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
            let question = Question(type: questionType, firstNumber: Int.random(in: 1...maxRange), secondNumber: Int.random(in: 1...maxRange))
            questions.append(question)
        }
    }
}

struct Question {
    var type: Int
    var firstNumber: Int
    var secondNumber: Int
    var correctAnswer: Int {
        switch self.type {
        case 0:
            return self.firstNumber + self.secondNumber
        case 1:
            return self.firstNumber - self.secondNumber
        case 2:
            return self.firstNumber * self.secondNumber
        default:
            return self.firstNumber + self.secondNumber
        }
    }
    var sign: String {
        switch self.type {
        case 0:
            return "+"
        case 1:
            return "-"
        case 2:
            return "x"
        default:
            return "+"
        }
    }
    
    func isCorrect(answer: Int) -> Bool {
        if(correctAnswer == answer) {
            return true
        } else {
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
