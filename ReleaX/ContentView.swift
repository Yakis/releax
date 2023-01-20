//
//  ContentView.swift
//  ReleaX
//
//  Created by Mugurel Moscaliuc on 19/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var buildVM: BuildsVM
    
    var body: some View {
        List {
            ForEach(buildVM.builds, id: \.id) { build in
                HStack {
                    Text("\(build.name.rawValue) \(build.version.number)")
                        .font(.body.bold())
                        .multilineTextAlignment(.leading)
                        .padding(5)
                    Spacer()
                    VStack(alignment: .trailing) {
                        let version = build.version.release.validValue.values.first! != 0 ? "\(build.version.release.validValue.values.first!)" : ""
                        Text("\(build.version.release.validValue.keys.first!) \(version)".uppercased())
                            .font(.caption2)
                            .frame(width: 60)
                            .padding(5)
                            .background(getColorFor(build.version.release.validValue.keys.first!))
                            .clipShape(Capsule())
                        Text("\(build.timestamp)")
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                            .padding(5)
                    }
                }
            }
        }
        .padding()
    }
    
    
    func getColorFor(_ type: String) -> Color {
        switch type {
        case "release": return .green.opacity(0.5)
        case "rc": return .blue.opacity(0.3)
        case "beta": return .orange.opacity(0.5)
        case "gmSeed": return .yellow.opacity(0.5)
        default: return .gray.opacity(0.5)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
