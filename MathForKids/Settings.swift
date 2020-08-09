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
    
    var body: some View {
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
    }
}
