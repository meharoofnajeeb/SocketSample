//
//  SocketHandler.swift
//  SocketSample
//
//  Created by Meharoof Najeeb on 2025-08-12.
//

import SocketIO
import Foundation

final class SocketHandler: ObservableObject {
    private let socket = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    private var mSocket: SocketIOClient!
    
    init() {
        self.mSocket = socket.defaultSocket
    }
    
    func getSocket() -> SocketIOClient {
        return mSocket
    }
    
    func establishConnection() {
        mSocket.connect()
    }
    
    func closeConnection() {
        mSocket.disconnect()
    }
}
