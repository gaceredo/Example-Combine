//
//  WireFrame.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import SwiftUI

protocol WireFrameProtocol {
    static func makeView() -> AnyView
}

struct WireFrame: WireFrameProtocol {
    
    static func makeView() -> AnyView {
        let interactorDependencies = InteractorDependencies()
        let interactor = Interactor(dependencies: interactorDependencies)
        let presenter = Presenter(interactor: interactor)
        let view = ContentView(presenter: presenter)
        return AnyView(view)
    }
}

