//
//  ViewLoadableProtocol.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import UIKit

protocol ViewLoadableControllerProtocol: UIViewController {
    associatedtype MainView: UIView
}

extension ViewLoadableControllerProtocol {
    var mainView: MainView {
        guard let customView = view as? MainView else {
            fatalError("Wrong configuration, view must exist!")
        }
        return customView
    }
}
