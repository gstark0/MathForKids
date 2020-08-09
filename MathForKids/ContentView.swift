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
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("pig")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.06), radius: 0, x: 0, y: 8)
                    .padding(.bottom, 40)
                
                if isPlaying {
                    
                } else {
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
                
                Button(isPlaying ? "Submit" : "Start") {
                    self.isPlaying = true
                }
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.init("Basic"))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
            }
            .navigationBarTitle("MathForKids", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
