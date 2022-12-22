//
//  APIResponse.swift
//  DBMenuBarApp
//
//  Created by Linus Eing on 22.12.22.
//

import Foundation

public struct Connectivity: Decodable {
    let currentState: String
    let nextState: String
    let remainingTimeSeconds: Int
}

public struct APIResponse: Decodable {
    let connection: Bool
    let serviceLevel: String
    let gpsStatus: String
    let internet: String
    let latitude: Float
    let longitude: Float
    let tileY: Int
    let tileX: Int
    let series: String
    let serverTime: Int64
    let speed: Float
    let trainType: String
    let tzn: String
    let wagonClass: String
    let bapInstalled: Bool
    let connectivity: Connectivity
}
