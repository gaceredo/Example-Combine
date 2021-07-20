//
//  ContentView.swift
//  Example-Combine
//
//  Created by Luis Aceredo on 19/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        ZStack {
            Text("Hello, world!").padding()
        }.onAppear {
            DispatchQueue.main.async {
                presenter.getRequest { }
            }
            DispatchQueue.main.async {
                presenter.postRequest { }
            }
        }
        
    }
    
    init(presenter: Presenter) {
        self.presenter = presenter
        
    }
}
