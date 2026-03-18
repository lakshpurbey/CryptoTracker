//
//  FavoritesStore.swift
//  CryptoTracker
//
//  Created by Lakshpurbey on 17/03/26.
//

import Foundation
import Combine

class FavoritesStore: ObservableObject {

    @Published var favorites: Set<String> = []

    func toggle(id: String) {

        if favorites.contains(id) {
            favorites.remove(id)
        } else {
            favorites.insert(id)
        }
    }

    func isFavorite(id: String) -> Bool {
        favorites.contains(id)
    }
}
