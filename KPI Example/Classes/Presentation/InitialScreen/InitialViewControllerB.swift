//
//  InitialViewControllerB.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 01.10.2021.
//

import UIKit

class InitialViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .custom)
        button.setTitle("Variant B", for: .normal)
        button.frame = .init(x: 20.0,
                             y: 20.0,
                             width: UIScreen.main.bounds.width - 40,
                             height: 60)
        view.addSubview(button)
        view.backgroundColor = .white
    }
}
