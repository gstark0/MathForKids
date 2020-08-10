//
//  Game.swift
//  MathForKids
//
//  Created by Greg Stark on 09/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI

struct Game: View {
    
    @State private var answer = ""
    @State private var progressValue = 0.3
    @State private var canSubmit = false
    
    var questions: [Question] = []
    @State private var currIndex = 0
    @State private var correctAnswers = 0
    @State private var incorrectAnswers = 0
    
    var body: some View {
        // On every TextField change, check if answer is integer and enable submit button if it is
        let binding = Binding<String>(get: {
            self.answer
        }, set: {
            self.answer = $0
            if Int(self.answer) != nil {
                self.canSubmit = true
            } else {
                self.canSubmit = false
            }
        })
        
        return ZStack {
            VStack {
                HStack(spacing: 30) {
                    Avatar(avatar: "pig")
                    VStack(alignment: .trailing, spacing: 7) {
                        Text("\(currIndex+1)/\(questions.count)")
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color("Background"))
                            .foregroundColor(Color(red: 158 / 255, green: 183 / 255, blue: 167 / 255))
                            .cornerRadius(5)
                        Text("\(correctAnswers) good")
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color("Basic"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        Text("\(incorrectAnswers) wrong")
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color(red: 233 / 255, green: 118 / 255, blue: 111 / 255))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                    .padding(.top, 80)
                    .padding(.bottom, 30)
                VStack {
                    Text("\(questions[self.currIndex].firstNumber)+\(questions[self.currIndex].secondNumber)=?")
                        .font(.system(size: 52, weight: .bold))
                        .foregroundColor(Color.init("DarkText"))
                        .padding(.top, 30)
                    TextField("Your answer", text: binding)
                        .keyboardType(.numberPad)
                        .frame(width: 245, height: 75, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 0, x: 0, y: 5)
                        .border(Color(red: 236 / 255, green: 244 / 255, blue: 239 / 255), width: 1) // TODO Think about making this a custom modifier and apply everywhere the same shadow instead of different one
                    Spacer()
                    BottomButton(text: "Submit", disabled: !canSubmit, onPress: {
                        if self.questions[self.currIndex].firstNumber + self.questions[self.currIndex].secondNumber == Int(self.answer)! {
                            // If the answer is correct
                            self.correctAnswers += 1
                        } else {
                            // If the answer is NOT correct
                            self.incorrectAnswers += 1
                        }
                        self.answer = ""
                        self.currIndex += 1
                    })
                }
                .background(Color("Background").edgesIgnoringSafeArea(.all))
                
            }
            
            
            GeometryReader { geometry in
                ProgressBar(progressValue: Double(self.currIndex+1)/Double(self.questions.count))
                    .padding(.horizontal)
                    .position(x: geometry.size.width * 0.5, y: 40)
            }
             
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
