//
//  BuildService.swift
//  ReleaX
//
//  Created by Mugurel Moscaliuc on 19/01/2023.
//

import Foundation

class BuildService {
    
    
    static func getBuilds() async -> [BuildResponseElement] {
        guard let url = URL(string: "https://xcodereleases.com/data.json") else { return [] }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let builds = try JSONDecoder().decode([BuildResponseElement].self, from: data)
            return builds
        } catch {
            print("Error retrieving builds: \(error)")
            return []
        }
    }
    
    
}
