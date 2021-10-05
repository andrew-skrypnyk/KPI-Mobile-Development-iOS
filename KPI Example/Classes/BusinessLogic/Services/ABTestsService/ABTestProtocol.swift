//
//  ABTestProtocol.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 01.10.2021.
//

import Foundation

protocol ABTestProtocol: RawRepresentable, Codable, CaseIterable {
    var probability: Double { get }
    static var analyticsIdentifier: String { get }
}
