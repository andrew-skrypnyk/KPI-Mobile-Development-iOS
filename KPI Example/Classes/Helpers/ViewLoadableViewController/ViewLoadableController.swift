//
//  ViewLoadableController.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 05.11.2021.
//

import UIKit

class ViewLoadableController<ViewType: UIView>: UIViewController, ViewLoadableControllerProtocol {
    typealias MainView = ViewType
    
    override func loadView() {
        view = MainView()
    }
}
