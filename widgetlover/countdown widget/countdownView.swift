//
//  countdownView.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import SwiftUI

struct countdownView: View {
    var title = "开始您的倒计时"
    var day:Int = 0

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
            }
            countdownTheme1(title: title, day: day)
            Spacer()
        }
        .background(Color.clock_widgetbgcolor)
    }
    
}

struct countdownTheme1: View {
    var title = "开始您的倒计时"
    var day:Int = 0
    
    let notweekColor = Color(red: 118/255, green: 64/255, blue: 239/255, opacity: 1)
    let activeColor = Color(red: 255/255, green: 74/255, blue: 140/255, opacity: 1)
    var body: some View {
        VStack(alignment: .center, spacing:8) {
            HStack(alignment: .bottom, spacing: 0.0){
                Text("\(day)")
                    .foregroundColor(notweekColor)
                    .baselineOffset(0.0)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                    .tracking(1.5)
                    .lineLimit(1)
                Text("DAY")
                    .baselineOffset(6.0)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(activeColor)
                
            }
            Text(title)
                .font(.system(size: 16))
                .bold()
                .foregroundColor(Color("commoncolor"))
        }
        .padding(.all)
    }
}
struct countdownView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            countdownView()
        }
    }
}
