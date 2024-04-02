//
//  WeatherButton.swift
//  swift ui - weatherapp
//
//  Created by Andrew Kim on 12/15/23.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    
    var body: some View {
        Text("Change Day Time")
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}

/*
 If a view is going to be reused throughout file then make it have its own file
 */
