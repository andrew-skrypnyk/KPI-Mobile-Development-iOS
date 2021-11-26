//
//  XibFirstViewController.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 23.11.2021.
//

import UIKit

class XibFirstViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backgroundView: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    private let viewModel: XibFirstViewModelProtocol
    
    init(viewModel: XibFirstViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetupUI()
        updateUI(for: viewModel.viewState)
    }

    @IBAction func onButtonTouch(_ sender: UIButton) {
        self.viewModel.didTapStartButton()
    }

    private func bindViewModel() {
        self.viewModel.onStateUpdate = { [unowned self] state in
            self.updateUI(for: state)
        }
    }
    
    private func initialSetupUI() {
        self.startButton.layer.cornerRadius = 75.0
        self.backgroundView.layer.cornerRadius = 75.0
        self.backgroundView.alpha = 0.5
    }
    
    private func updateUI(for state: FirstViewState) {
        switch state {
        case .idle:
            self.startButton.isUserInteractionEnabled = true
            self.startButton.setTitle("Start Search", for: .normal)
            self.statusLabel.text = "Idle"
            self.backgroundView.layer.removeAnimation(forKey: "scaling")
        case .search:
            self.startButton.isUserInteractionEnabled = false
            self.startButton.setTitle("Searching...", for: .normal)
            self.statusLabel.text = "Searching..."
            
            let animation = scaleAnimation(withDuration: 0.5)
            self.backgroundView.layer.add(animation, forKey: "scaling")
            
            
            
            
//            UIView.animate(withDuration: 0.5,
//                           delay: 0.0,
//                           options: [.repeat, .autoreverse]) {
//                self.backgroundView.transform = .init(scaleX: 1.4, y: 1.4)
//            } completion: { _ in
//
//            }
        }
    }
    
    private func scaleAnimation(withDuration dur: CFTimeInterval) -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 1.4
        scaleAnimation.duration = dur
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        
        return scaleAnimation
    }
}
