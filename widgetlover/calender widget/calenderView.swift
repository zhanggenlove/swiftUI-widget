//
//  calenderView.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/16.
//

import SwiftUI

struct calenderView: View {
    var body: some View {
        calenderViewTheme1()
    }
}

struct calenderViewTheme1: View {
    let columns = [GridItem](repeating: .init(), count: WeekNames.count)
    //let weekColor = Color(red: 128/255, green: 131/255, blue: 137/255, opacity: 1)
    let weekColor = Color(red: 255/255, green: 170/255, blue: 92/255, opacity: 1)
    //let notweekColor = Color(red: 64/255, green: 64/255, blue: 64/255, opacity: 1)
    let notweekColor = Color(red: 119/255, green: 64/255, blue: 239/255, opacity: 1)
    let activeColor = Color(red: 255/255, green: 74/255, blue: 140/255, opacity: 1)
    
    var body: some View {
        
        VStack(content: {
            

            LazyVGrid(columns: [GridItem()], alignment: .leading) {
                Text(CalenderHelper.monthName)
                    .foregroundColor(activeColor)
                    .font(.caption)
                    .fontWeight(.black)
            }

            LazyVGrid(columns: columns) {
                
                ForEach((0...6), id: \.self) {
                    
                    Text(WeekNames[$0])
                        .foregroundColor($0 == 0 || $0 == 6 ? weekColor : notweekColor)
//                        .fontWeight(.black)
                    
                }
            }
            
            LazyVGrid(columns: columns, spacing: CalenderHelper.countOfItems > 35 ? 1:3) {
                
                ForEach((0..<CalenderHelper.countOfItems), id: \.self) {
             
                    let color: Color = $0 % 7 == 0 || $0 % 7 == 6 ? weekColor: notweekColor
                    let isToday = $0 == CalenderHelper.indexOfToday
                    let foregroundColor: Color = isToday ? .white : color
                    
                    Text(CalenderHelper.items[$0])
                        //.fontWeight(.bold)
                        .frame(width: 16, height: 16)
                        .foregroundColor(foregroundColor)
                        .background(isToday ? activeColor : Color.clear)
                        .cornerRadius(16/2)
                        .padding(.all,1)

                }
            }
            
            
        })
        .font(.caption2)
        .padding()
        
        
    }
}
struct calenderView_Previews: PreviewProvider {
    static var previews: some View {
        calenderView()
    }
}
