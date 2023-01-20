//
//  BuildsVM.swift
//  ReleaX
//
//  Created by Mugurel Moscaliuc on 19/01/2023.
//

import Foundation

@MainActor
class BuildsVM: ObservableObject {
    
    @Published var builds: [BuildResponseElement] = []
    
    
    init() {
        getBuilds()
    }
    
    
    func getBuilds() {
        Task {
            builds = await BuildService.getBuilds()
        }
    }
    
    
}
