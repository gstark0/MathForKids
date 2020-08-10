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
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .edgesIgnoringSafeArea(.all)
                Color("Background")
                    .frame(height: 520)
                    .edgesIgnoringSafeArea(.all)
            }
            VStack {
                Spacer()
                Text("3+4=?")
                    .font(.system(size: 52, weight: .bold))
                    .foregroundColor(Color.init("DarkText"))
                TextField("Your answer", text: $answer)
                    .keyboardType(.numberPad)
                    .frame(width: 245, height: 75, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .border(Color(red: 236 / 255, green: 244 / 255, blue: 239 / 255), width: 1)
                    // TODO add shadow
                Spacer()
                BottomButton(text: "Submit", disabled: true, onPress: {
                    
                })
                
            }
            
            GeometryReader { geometry in
                ProgressBar(progressValue: self.$progressValue)
                    .padding(.horizontal)
                    .position(x: geometry.size.width * 0.5, y: 50)
            }
        }
    }
}
