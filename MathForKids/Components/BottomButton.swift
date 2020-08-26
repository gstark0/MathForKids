//
//  BottomButton.swift
//  MathForKids
//
//  Created by Greg Stark on 10/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI

struct BottomButton: View {
    var text: String
    var disabled = false
    var color = "Basic"
    var onPress: () -> ()
    
    var body: some View {
        Button(text) {
            self.onPress()
        }
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(disabled ? "DisabledBasic" : color))
            .cornerRadius(5)
            .padding(.horizontal)
            .padding(.bottom, 30)
            .disabled(disabled)
    }
}
