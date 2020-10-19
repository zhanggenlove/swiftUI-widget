//
//  batteryView.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/14.
//

import Foundation
import SwiftUI
import Progress_Bar

struct batteryView: View {
    var percentage: Float
    var batterystatus: Int
    var time: String
    var pvalue: CGFloat {
        (CGFloat(percentage) * 100).rounded() / 100
    }
    
    var body: some View {
        circleProgress(percentage: percentage, pvalue: pvalue, time: time, batterystatus: batterystatus)
    }
}

struct circleProgress: View {
    var percentage: Float
    var pvalue: CGFloat
    var time: String
    var batterystatus: Int
    var body: some View {
        VStack(alignment: .center, spacing: 4, content: {
            timeView(time: time)
            CircularProgress(percentage: pvalue,
                                             fontSize: 18,
                                             backgroundColor: Color.battery_widgetbgcolor,
                                             fontColor : Color.battery_batterytextcolor,
                                             borderColor1: Color.battery_bordercolor1,
                                             borderColor2: LinearGradient(gradient: Gradient(colors: [Color(UIColor(hex: "A240EF")), Color(UIColor(hex: "793DFF"))]),startPoint: .top, endPoint: .bottom),
                                             borderWidth: 10
                             )
            batteryStatus(batterystatus: batterystatus, percentage: percentage)
        }).padding(.bottom,4)
        .background(Color.battery_widgetbgcolor)
    }
    
}
struct batteryStatus: View {
    var batterystatus: Int
    var percentage:Float
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            if(batterystatus == 2) {
                Image("charging")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15, alignment: .center)
                Text("正在充电")
                    .font(.system(size: 12))
                    .foregroundColor(Color.battery_batterytiptextcolor)
            }else if(percentage < 0.3) {
                Image("charge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15, alignment: .center)
                Text("需要充电")
                    .font(.system(size: 12))
                    .foregroundColor(Color.battery_batterytiptextcolor)
            }else {
                Image("uncharge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15, alignment: .center)
                Text("电池放电中")
                    .font(.system(size: 12))
                    .foregroundColor(Color.battery_batterytiptextcolor)
            }
        })
    }
    
}

struct timeView: View {
    var time: String
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            Image("chargelogo")
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26, alignment: .center)
            Spacer()
            Text(time)
                .bold()
                .font(.system(size: 12))
                .foregroundColor(Color.battery_timetextcolor)
        }).padding(.trailing,10)
        .padding(.top,6)
        .padding(.leading,12)
    }
}

//D5DBE8 9DAAC7
struct batteryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 0, content: {
            timeView(time: "08:56")
            CircularProgress(percentage: (CGFloat(0.4399999976158142) * 100).rounded() / 100,
                                             fontSize: 18,
                                             backgroundColor: .white,
                                             fontColor : Color(UIColor(hex: "9DAAC7")),
                                             borderColor1: Color(UIColor(hex: "D5DBE8")),
                                             borderColor2: LinearGradient(gradient: Gradient(colors: [Color(UIColor(hex: "A240EF")), Color(UIColor(hex: "793DFF"))]),startPoint: .top, endPoint: .bottom),
                                             borderWidth: 25
                             )
            batteryStatus(batterystatus: 1, percentage: 0.3)
        })
        .environment(\.sizeCategory, .medium)
                      
    }
}
