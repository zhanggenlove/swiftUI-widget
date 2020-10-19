//
//  widgetloverApp.swift
//  widgetlover
//
//  Created by 张亦梓 on 2020/10/14.
//

import SwiftUI

@main
struct widgetloverApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct widgetloverApp_Previews: PreviewProvider {
    static var previews: some View {
        ///*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        ContentView()
    }
}
