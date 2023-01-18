//
//  ContentView.swift
//  WheaterApp
//
//  Created by Emrullah Demir on 18.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundColor(isNight: $isNight)
            
            VStack{
                Text("Gümüşhane, TR")
                    .font(.system(size: 40, weight:.medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                    
                    
                VStack(spacing:3){
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("7")
                        .font(.system(size: 70, weight:.medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom,40)
                HStack(spacing:20){
                    daySummaryItem(day: "PTS", imageName: "sun.max.fill", temperature: 22)
                    daySummaryItem(day: "SAL", imageName: "sun.max.fill", temperature: 12)
                    daySummaryItem(day: "ÇAR", imageName: "sun.max.fill", temperature: 32)
                    daySummaryItem(day: "PER", imageName: "thermometer.snowflake", temperature: 0)
                    daySummaryItem(day: "CUM", imageName: "sun.max.fill", temperature: 5)
                    
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    Text("Change day time")
                        .frame(width: 280,height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .font(.system(size: 20,weight: .bold))
                }
                Spacer()
            }
           
           
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct daySummaryItem: View {
    
    var day:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size:20,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 30)
            Text("\(temperature)")
                .font(.system(size:22, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColor: View {
    @Binding  var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .blue,.white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
