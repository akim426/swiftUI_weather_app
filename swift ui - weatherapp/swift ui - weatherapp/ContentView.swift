//
//  ContentView.swift
//  swift ui - weatherapp
//
//  Created by Andrew Kim on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false //View hiearchy, passing it down to the children
    
    
    var body: some View {
        ZStack { // Can Only have 10 views
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Atlanta, GA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                    imageName: "cloud.sun.fill",
                                    temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                    imageName: "sun.max.fill",
                                    temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                    imageName: "wind.snow",
                                    temperature: 32)
                    WeatherDayView(dayOfWeek: "FRI",
                                    imageName: "sunset.fill",
                                    temperature: 68)
                    WeatherDayView(dayOfWeek: "SAT",
                                    imageName: "snow",
                                    temperature: 28)
                }
                Spacer()
                    
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue, backgroundColor: .white)
                    
                }
                    
                Spacer()
                }
                
            }
        }
            }


#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool //Binding makes sure the State variable is same as BackgroundView                            variable
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightgreen")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()// Order of elements matter
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            
            VStack {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("\(temperature) °")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
            }
            
            .padding(.bottom, 40)
        }
    }
}


