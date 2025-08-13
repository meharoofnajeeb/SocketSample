//
//  ViewModel.swift
//  SocketSample
//
//  Created by Meharoof Najeeb on 2025-08-13.
//

import Combine
import SocketIO
import Foundation

class ViewModel: ObservableObject {
    @Published var counter: Int = 0
    @Published var textReceived: String = ""
    @Published var textToSend: String = ""
    var socketHandler: SocketHandler
    let userID = UUID()
    lazy private var mSocket: SocketIOClient = {
        return socketHandler.getSocket()
    }()
    
    init(handler: SocketHandler) {
        socketHandler = handler
        setup()
    }
    
    private func setup() {
        socketHandler.establishConnection()
        
        mSocket.on("counter") { dataArray, ack in
            guard let data = dataArray[0] as? Int else {
                print("error")
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.counter = data
            }
        }
        
        mSocket.on("messageReceived") { [weak self] dataArray, ack in
            print("Data array - \(dataArray)")
            guard let message = dataArray[0] as? String, let senderId = dataArray[1] as? String, senderId != self?.userID.uuidString else {
                print("error")
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.textReceived = message
            }
        }
    }
    
    func emitCounter() {
        mSocket.emit("counter")
    }
    
    func sendMessage() {
        mSocket.emit("message", textToSend, userID.uuidString)
    }
    
    deinit {
        socketHandler.closeConnection()
    }
}
