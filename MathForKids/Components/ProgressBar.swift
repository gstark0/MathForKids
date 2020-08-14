//
//  ProgressBar.swift
//  MathForKids
//
//  Created by Greg Stark on 09/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    var progressValue: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 210 / 255, green: 210 / 255, blue: 210 / 255))
                    .frame(width: geometry.size.width, height: 2)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 32 / 255, green: 202 / 255, blue: 90 / 255))
                    .frame(width: geometry.size.width * CGFloat(self.progressValue), height: 6)
            }
        }
    }
}
