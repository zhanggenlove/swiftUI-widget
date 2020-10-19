//
//  weatherView.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import SwiftUI

struct weatherView: View {
    @ObservedObject var weatherVM: WeatherVM
    
    init() {
        self.weatherVM = WeatherVM()
    }
    
    var body: some View {
        weathertopView()
    }
}

struct weathertopView: View {
    var body: some View {
        VStack {
            Image("sun")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            Text("30℃")
                .bold()
                .font(.system(size: 24))
            Text("昆明市")
                .font(.system(size: 18))
                .foregroundColor(Color(red: 99/255, green: 115/255, blue: 129/255, opacity: 1))
            HStack {
                weathersquare(icon: "Icon", text: "24km/h")
                weathersquare(icon: "Icon1", text: "东南风")
            }
        }
    }
}

struct weathersquare: View {
    var icon: String
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 64, height: 49)
                .foregroundColor(Color(red: 235/255, green: 245/255, blue: 255/255, opacity: 1))
                .cornerRadius(8)
            VStack {
                Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                Text(text)
                    .bold()
                    .font(.system(size: 10))
            }
        }
    }
    
}
struct weatherView_Previews: PreviewProvider {
    static var previews: some View {
        weatherView()
    }
}
