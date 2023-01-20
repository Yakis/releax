//
//  ReleaXApp.swift
//  ReleaX
//
//  Created by Mugurel Moscaliuc on 19/01/2023.
//

import SwiftUI

@main
struct ReleaXApp: App {
    
    @StateObject var buildVM = BuildsVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(buildVM)
        }
    }
}
