//
//  SocketSampleApp.swift
//  SocketSample
//
//  Created by Meharoof Najeeb on 2025-08-12.
//

import SwiftUI

@main
struct SocketSampleApp: App {
    let socketHandler: SocketHandler
    let viewModel: ViewModel
    
    init() {
        socketHandler = SocketHandler()
        viewModel = ViewModel(handler: socketHandler)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
