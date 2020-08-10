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
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.answer
        }, set: {
            self.answer = $0
            print(self.answer)
        })
        
        return ZStack {
            VStack {
                HStack(spacing: 30) {
                    Avatar(avatar: "pig")
                    VStack(alignment: .trailing, spacing: 7) {
                        Text("7/10")
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color("Background"))
                            .foregroundColor(Color(red: 158 / 255, green: 183 / 255, blue: 167 / 255))
                            .cornerRadius(5)
                        Text("5 good")
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color("Basic"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        Text("1 wrong")
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
                    Text("3+4=?")
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
                        .border(Color(red: 236 / 255, green: 244 / 255, blue: 239 / 255), width: 1)
                        // TODO add shadow
                    Spacer()
                    BottomButton(text: "Submit", disabled: canSubmit, onPress: {
                        
                    })
                }
                .background(Color("Background").edgesIgnoringSafeArea(.all))
                
            }
            
            
            GeometryReader { geometry in
                ProgressBar(progressValue: self.$progressValue)
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
