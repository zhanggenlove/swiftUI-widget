//
//  quickStartView.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/15.
//

import SwiftUI

struct quickStartView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
            }
            squareContainer()
            Spacer()
        }
        .background(Color.quickstart_widgetbgcolor)
    }
}
struct quickStartViewMedium: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
            }
            squareContainerMedium()
            Spacer()
        }
        .background(Color.quickstart_widgetbgcolor)
    }
}
//小方格
struct square: View {
    var icon: String
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 55, height: 55)
                .foregroundColor(Color.quickstart_widgetbgcolor)
                .cornerRadius(15)
                .shadow(color: Color.quickstart_shadowcolor1, radius: 10, x: -4, y: -4)
                .shadow(color: Color.quickstart_shadowcolor2, radius: 10, x: 4, y: 4)
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
    }
}
//
struct squareContainer: View {
    var body: some View {
        VStack(spacing:10) {
//            HStack(spacing:16) {
//                square(icon: "Subtract")
//                square(icon: "Vector")
//            }
//            HStack(spacing:16) {
//                square(icon: "google")
//                square(icon: "Group")
//            }
                HStack(spacing:16) {
                    square(icon: "wechat")
                    square(icon: "qq")
                }
                HStack(spacing:16) {
                    square(icon: "alipay")
                    square(icon: "wepay")
                }
        }
    }
    
}
//systemMedium
struct squareContainerMedium: View {
    var body: some View {
        VStack(spacing:10) {
            HStack(spacing:16) {
                square(icon: "wechat")
                square(icon: "qq")
                square(icon: "alipay")
                square(icon: "wepay")
            }
            HStack(spacing:16) {
                square(icon: "Subtract")
                square(icon: "Vector")
                square(icon: "google")
                square(icon: "Group")
            }
        }
    }
    
}
struct quickStartView_Previews: PreviewProvider {
    static var previews: some View {
        quickStartView()
    }
}
