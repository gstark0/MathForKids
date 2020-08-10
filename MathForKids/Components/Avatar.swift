//
//  Avatar.swift
//  MathForKids
//
//  Created by Greg Stark on 10/08/2020.
//  Copyright © 2020 Gregory Stark. All rights reserved.
//

import SwiftUI

struct Avatar: View {
    var avatar: String
    
    var body: some View {
        Image(avatar)
            .resizable()
            .scaledToFit()
            .frame(width: 120)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.06), radius: 0, x: 0, y: 8)
    }
}
