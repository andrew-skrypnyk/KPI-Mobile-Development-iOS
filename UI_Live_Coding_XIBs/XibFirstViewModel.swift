//
//  XibFirstViewModel.swift
//  KPI Example
//
//  Created by Aleksey Filobok on 26.11.2021.
//

import Foundation
import Combine

enum FirstViewState {
    case idle
    case search
}

protocol XibFirstViewModelProtocol: AnyObject {
    var viewState: FirstViewState { get }
    
    var onStateUpdate: ((FirstViewState) -> Void)? { get set }
    
    func didTapStartButton()
}

final class FirstViewModel: XibFirstViewModelProtocol {
    var viewState: FirstViewState = .idle {
        didSet {
            onStateUpdate?(viewState)
        }
    }
    
    @Published var state: FirstViewState = .idle
    
    var onStateUpdate: ((FirstViewState) -> Void)?
    
    private let shazamService: ShazamServiceProtocol
    
    init(
        shazamService: ShazamServiceProtocol
    ) {
        self.shazamService = shazamService
    }
    
    func didTapStartButton() {
        self.viewState = .search
        
        self.shazamService.startSearch { [unowned self] in
            self.viewState = .idle
        }
    }
}


protocol ShazamServiceProtocol {
    func startSearch(completion: (() -> Void)?)
}

final class NewShazamService: ShazamServiceProtocol {
    func startSearch(completion: (() -> Void)?) {
        print("search")
    }
}

final class ShazamService: ShazamServiceProtocol {
    
    
    func startSearch(completion: (() -> Void)?) {
        DispatchQueue.global().async {
            sleep(5)
            DispatchQueue.main.async {
                completion?()
            }
        }
    }
}
