//
//  WebSocketManager.swift
//  CryptoTracker
//
//  Created by Laxmipurbey on 17/03/26.
//

import Foundation

final class WebSocketManager {

    static let shared = WebSocketManager()

    private var socketTask: URLSessionWebSocketTask?

    private let url = URL(
        string: "wss://stream.binance.com:9443/ws/btcusdt@trade"
    )!

    var onReceive: ((CryptoPriceUpdate) -> Void)?

    func connect() {

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
                    self?.handle(text: text)

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

            let decoded = try JSONDecoder().decode(BinanceTrade.self, from: data)

            let update = CryptoPriceUpdate(
                id: "bitcoin",
                price: Double(decoded.price) ?? 0
            )

            onReceive?(update)

        } catch {
            print("Decode error:", error)
        }
    }
}
