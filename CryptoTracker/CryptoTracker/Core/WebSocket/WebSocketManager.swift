//
//  WebSocketManager.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

import Foundation

final class WebSocketManager {

    static let shared = WebSocketManager()

    private var socketTask: URLSessionWebSocketTask?

    private let url = URL(
        string: "wss://stream.binance.com:9443/ws/btcusdt@trade"
    )!

    var onReceive: ((TickerUpdate) -> Void)?

    func connect(symbols: [String]) {
        
        let streams = symbols
            .map { "\($0.lowercased())@trade" }
            .joined(separator: "/")

        let url = URL(
            string: "wss://stream.binance.com:9443/stream?streams=\(streams)"
        )!

        socketTask = URLSession.shared.webSocketTask(with: url)
        socketTask?.resume()

        listen()
    }

    func disconnect() {
        socketTask?.cancel(with: .goingAway, reason: nil)
    }

    private func listen() {

        socketTask?.receive { [weak self] result in

            switch result {

            case .success(let message):

                switch message {

                case .string(let text):
                    
                    if case .string(let text) = message {
                        self?.handle(text: text)
                                   }


                default:
                    break
                }

            case .failure(let error):
                print("WebSocket error:", error)
            }

            self?.listen()
        }
    }

    private func handle(text: String) {

        guard let data = text.data(using: .utf8) else { return }

        do {

            let decoded = try JSONDecoder().decode(StreamResponse.self, from: data)

            let update = TickerUpdate(
                           symbol: decoded.data.symbol,
                           price: Double(decoded.data.price) ?? 0
                       )

            onReceive?(update)

        } catch {
            print("Decode error:", error)
        }
    }
}
