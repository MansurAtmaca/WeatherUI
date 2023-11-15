//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mansurcan ATMACA on 13.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var dayOrNight = true;
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack(){
               CityTextView(cityName: "İstanbul")
                MainWeatherStatus(imageName: isNight ?"moon.stars.fill" :"sun.max.fill", temperature: isNight ? 13:42)
                HStack(spacing:20){
                    WeatherDayView(dayName: "PZT",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 35)
                    WeatherDayView(dayName: "SAL",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 32)
                    WeatherDayView(dayName: "ÇAR",
                                   imageName: "sun.max.fill",
                                   temperature: 38)
                    WeatherDayView(dayName: "PER",
                                   imageName: "sun.rain.fill",
                                   temperature: 23)
                    WeatherDayView(dayName: "CUM",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 25)
                }
                .padding(.bottom,50)
                Button{
                    isNight = !isNight
                }label: {
                    ButtonLabelView(labelText: "Zamanı Değiştir", backgroundColor: .white, textColor: .blue)
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
    var dayName: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayName)
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40,height: 40)
                .aspectRatio(contentMode: .fit)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundStyle(.white)
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
   
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct MainWeatherStatus: View {
    var imageName: String
    var temperature : Int
    var body: some View {
        VStack(spacing : 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(temperature)°")
                .font(.system(size: 80, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom,60)
    }
}

struct CityTextView: View {
    
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}
struct ButtonLabelView:View {
    var labelText : String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(labelText)
            .frame(width: 280,height: 50)
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundStyle(textColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
