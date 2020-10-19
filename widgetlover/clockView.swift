//
//  clockView.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/15.
//

import SwiftUI

struct clockView: View {
    var date: Date
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
            }
            dialplace(date: date)
            Spacer()
        }
        .background(Color.clock_widgetbgcolor)
    }
}
//小组件
struct shadowCircle: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: width, height: height)
            .foregroundColor(Color.clock_widgetbgcolor)
            .overlay(Circle()
                        .stroke(Color.clear, lineWidth: 1))
            .shadow(color: Color.clock_shadowcolor1, radius: 10, x: -4, y: -4)
                        .shadow(color: Color.clock_shadowcolor2, radius: 10, x: 4, y: 4)
            .padding(.all,0)
    }
    
}

//指示小方块
struct smallSquare: View {
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(Color.clock_tickmarkcolor)
            .overlay(Rectangle()
                            .stroke(Color.clear, lineWidth: 1))
//            .shadow(color: Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 0.72), radius: 3, x: -1, y: -1)
//                            .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.19), radius: 3, x: 1, y: 1)
    }
    
}
//水平小方块组合
struct hsmallSquareGroup: View {
    var body: some View {
        HStack {
            smallSquare(width: 12,height: 4)
            Spacer()
            smallSquare(width: 12,height: 4)
        }.frame(width: 120, height:4 )
    }
}
//shuzhi组合
struct vsmallSquareGroup: View {
    var body: some View {
        VStack {
            smallSquare(width: 2,height: 4)
            Spacer()
            smallSquare(width: 2,height: 4)
        }.frame(width: 2, height:120 )
    }
}

//组合叠加
struct dialplace: View {
    var date: Date
    var body: some View {
        ZStack(alignment: .center) {
            shadowCircle(width: 120, height: 120)
//            hsmallSquareGroup()
//            vsmallSquareGroup()
            ForEach(0...12,id: \.self) { i in
                vsmallSquareGroup()
                    .rotationEffect(Angle(degrees: Double(i * 30)))
            }
            shadowCircle(width: 81, height: 81)
            hourhand(width: 26, height: 3.32, date: date)
            minutehand(width: 42, height: 1.8, date: date)
            shadowCircle(width: 14, height: 14)
        }
    }
    
}

//时针 //3:15 时针旋转3 * 30 + (15/60)*30 = 90 + 7.5 = 97.5 分钟旋转 15 * 6
struct hourhand: View {
    var width: CGFloat = 26
    var height: CGFloat = 3.32
    var date: Date
    var hourAngle: Double {
        let calendar = NSCalendar.current
        let minuteInt = calendar.component(.minute, from: date)
        var hourInt = calendar.component(.hour, from: date)
        if hourInt > 12 {
            hourInt -= 12
        }
        print(minuteInt)
        print(hourInt)
        let minutemarke = Int(Double(minuteInt) * 0.5)
        let angle = hourInt * 30 + minutemarke
        print(angle)
        return Double(angle)
    }
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(Color.clear)
            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(Color.clock_hourhandcolor)
                .cornerRadius(3.0)
                .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.25), radius: 5, x: 5, y: 10)
        }.rotationEffect(Angle(degrees: 270))
        .rotationEffect(Angle(degrees: hourAngle))
    }
}
//分针
struct minutehand: View {
    var width: CGFloat = 47
    var height: CGFloat = 1.7
    var date: Date
    var mourAngle: Double {
        let calendar = NSCalendar.current
        let minuteInt = CGFloat(calendar.component(.minute, from: date))
        print(minuteInt)
        let angle = minuteInt * 6
        return Double(angle)
    }
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(Color.clear)
            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(Color.clock_minutehandcolor)
                .cornerRadius(3.0)
                .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.25), radius: 5, x: 5, y: 10)
        }.rotationEffect(Angle(degrees: 270))
        .rotationEffect(Angle(degrees: mourAngle))
    }
}
struct clockView_Previews: PreviewProvider {
    static var previews: some View {
        clockView(date: Date())
    }
}
