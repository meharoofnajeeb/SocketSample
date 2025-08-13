//
//  ContentView.swift
//  SocketSample
//
//  Created by Meharoof Najeeb on 2025-08-12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("\(viewModel.counter)")
                Spacer()
                Button {
                    viewModel.emitCounter()
                } label: {
                    Text("Counter")
                }
            }
            
            VStack {
                Text("\(viewModel.textReceived)")
                HStack {
                    TextField("Message to be sent", text: $viewModel.textToSend)
                    Button {
                        viewModel.sendMessage()
                    } label: {
                        Text("SEND")
                    }
                }
            }
        }
        .padding()
    }
}
