//
//  ABTestProtocol.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 01.10.2021.
//

import Foundation

/**
 У нас есть протокол ABTestProtocol, с помощью которого мы сможем создавать новые виды АБ тестов, что бы они были одного вида
 */

protocol ABTestProtocol: RawRepresentable, Codable, CaseIterable {
    var probability: Double { get }
    static var analyticsIdentifier: String { get }
}
