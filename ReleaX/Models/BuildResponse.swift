//
//  BuildResponse.swift
//  ReleaX
//
//  Created by Mugurel Moscaliuc on 19/01/2023.
//

import Foundation

// MARK: - BuildResponseElement
struct BuildResponseElement: Codable {
    let compilers: Compilers?
    let requires: String
    let date: DateClass
    let links: Links?
    let version: Version
    let sdks: Sdks?
    let name: Name
    let checksums: Checksums?
    
    var id: String {
        return "\(version.number)_\(version.build)_\(date.day).\(date.month).\(date.year)"
    }
    
    var timestamp: String {
        let compMonth = date.month < 10 ? "0\(date.month)" : "\(date.month)"
        let compYear = "\(date.year)".replacingOccurrences(of: ",", with: "")
        return "\(date.day).\(compMonth).\(compYear)"
    }
    
    
}

// MARK: - Checksums
struct Checksums: Codable {
    let sha1: String
}

// MARK: - Compilers
struct Compilers: Codable {
    let clang, swift, llvm, llvmGCC: [Clang]?
    let gcc: [Clang]?

    enum CodingKeys: String, CodingKey {
        case clang, swift, llvm
        case llvmGCC = "llvm_gcc"
        case gcc
    }
}

// MARK: - Clang
struct Clang: Codable {
    let number, build: String?
    let release: ClangRelease
}

// MARK: - ClangRelease
struct ClangRelease: Codable {
    let release: Bool
}

// MARK: - DateClass
struct DateClass: Codable {
    let year, month, day: Int
}

// MARK: - Links
struct Links: Codable {
    let notes, download: Download?
}

// MARK: - Download
struct Download: Codable {
    let url: String
}

enum Name: String, Codable {
    case xcode = "Xcode"
    case xcodeTools = "Xcode Tools"
    case xcodeUniversal = "Xcode (Universal)"
}

// MARK: - Sdks
struct Sdks: Codable {
    let macOS, tvOS, iOS, watchOS: [Clang]?
}

// MARK: - Version
struct Version: Codable {
    let number, build: String
    let release: VersionRelease
}

// MARK: - VersionRelease
struct VersionRelease: Codable {
    
    let release: Bool?
    let rc, beta: Int?
    let gm: Bool?
    let gmSeed, dp: Int?
    
    var validValue: [String: Int] {
        for _ in 0...1 {
            if release != nil {
                return ["release": 0]
            }
            if let rc = rc {
                return ["rc": rc]
            }
            if let beta = beta {
                return ["beta": beta]
            }
            if gm != nil {
                return ["gm": 0]
            }
            if let gmSeed = gmSeed {
                return ["gmSeed": gmSeed]
            }
            if let dp = dp {
                return ["dp": dp]
            }
        }
        return ["release": 0]
    }
    
}

typealias BuildResponse = [BuildResponseElement]
