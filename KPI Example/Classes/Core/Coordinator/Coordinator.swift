//
//  Coordinator.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 30.09.2021.
//

import Foundation

protocol Coordinator: AnyObject {
    var childs: [Coordinator] { get set }
    
    func start()
    
    func addChild(_ child: Coordinator)
    func removeChild(_ child: Coordinator)
    func removeAllChilds()
}

extension Coordinator {
    func addChild(_ child: Coordinator) {
        self.childs.append(child)
    }
    
    func removeChild(_ child: Coordinator) {
        self.childs.removeAll(where: { $0 === child })
    }
    
    func removeAllChilds() {
        self.childs.removeAll()
    }
}
