//
//  Presenter.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import Foundation
import Combine

protocol PresenterProtocol {
    func getRequest(completion: @escaping () -> Void)
    func postRequest(completion: @escaping () -> Void)
}

class Presenter: PresenterProtocol, ObservableObject {
    
    private let interactor: InteractorProtocol
    
    init(interactor: InteractorProtocol) {
        self.interactor = interactor
    }
    
    func getRequest(completion: @escaping () -> Void) {
        interactor.request(query: []) { result in
            completion()
        }
    }
    
    func postRequest(completion: @escaping () -> Void) {
        interactor.request(query: []) { result in
            completion()
        }
    }
}
