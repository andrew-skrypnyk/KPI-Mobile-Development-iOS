//
//  InitialViewControllerA.swift
//  KPI Example
//
//  Created by Oleksii Filobok on 01.10.2021.
//

import UIKit

class InitialViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: .init(x: 20.0,
                                         y: 20.0,
                                         width: UIScreen.main.bounds.width - 40,
                                         height: 60))
        label.textColor = .black
        label.text = "Variant A"
        view.addSubview(label)
        view.backgroundColor = .white
    }
}
